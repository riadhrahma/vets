import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';

abstract class ProfileOnlineDataSource {
  //the same for all users
  Future<Unit> updateProfile(ClientEntity clientEntity);
}

class ProfileDataSourceImpl implements ProfileOnlineDataSource {
  // ignore: prefer_typing_uninitialized_variables
  final firestore;
  // ignore: prefer_typing_uninitialized_variables
  final auth;

  final CollectionReference<Map<String, dynamic>> veterinaryCollection;

  final CollectionReference<Map<String, dynamic>> clientCollection;

  late final User user;

  ProfileDataSourceImpl(this.firestore, this.auth)
      : veterinaryCollection = firestore.collection('veterinary'),
        clientCollection = firestore.collection('client');

  @override
  Future<Unit> updateProfile(ClientEntity clientEntity) async {
    try {
      ClientModel clientModel = ClientModel(
        gender: clientEntity.gender,
        id: clientEntity.id,
        address: clientEntity.address,
        email: clientEntity.email,
        lastName: clientEntity.lastName,
        name: clientEntity.name,
        phoneNumber: clientEntity.phoneNumber,
        photoUrl: clientEntity.photoUrl,
        isVip: clientEntity.isVip,
        role: clientEntity.role,
        clientCode: clientEntity.clientCode,
        isEmergencyAgent: clientEntity.isEmergencyAgent,
        fcmToken: clientEntity.fcmToken,
      );
      await clientCollection
          .doc(
            clientEntity.id,
          )
          .update(
            clientModel.toJson(),
          );
      return unit;
    } catch (e) {
      throw UnknownError();
    }
  }
}
