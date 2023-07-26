import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:vets_project/core/common_used/firebase_collection/extensions/collection_extension.dart';
import 'package:vets_project/core/common_used/firebase_collection/firebase_collection.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

abstract class PetManagmentRemoteDataSource {
  Future<Unit> addNewPet(PetModel petModel);
  Future<List<PetModel>> getMyPets(String clientID);
  Future<Unit> updatePetData(PetModel petModel);
  Future<Unit> deleteMyPet(String petID);
  Future<bool> ispetExist(String petID);
  Future<XFile?> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  );
  Future<String> uploadFile(
    String filePath,
  );
}

class FirebasePetMangementDataSource implements PetManagmentRemoteDataSource {
  @override
  Future<Unit> addNewPet(PetModel petModel) async {
    try {
      await FirebaseCollection.petCollectionName.collection
          .doc(petModel.id)
          .set(petModel.toMap());
      return Future.value(unit);
    } catch (_) {
      throw ServerException('');
    }
  }

  @override
  Future<Unit> deleteMyPet(String petID) async {
    final result =
        await FirebaseCollection.petCollectionName.collection.doc(petID).get();
    final ispetExist = result.exists;
    if (ispetExist) {
      try {
        await FirebaseCollection.petCollectionName.collection
            .doc(petID)
            .delete();
        return Future.value(unit);
      } on ServerException {
        throw ServerException('');
      }
    } else {
      throw DocumentNotExistException();
    }
  }

  @override
  Future<List<PetModel>> getMyPets(String clientID) async {
    try {
      final QuerySnapshot<Object?> querySnapshot = await FirebaseCollection
          .petCollectionName.collection
          .where('ownerID', isEqualTo: clientID)
          .get();
      List<PetModel> petsList = querySnapshot.docs.map((e) {
        return PetModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      return petsList;
    } on ServerException  catch(e){

      throw ServerException(e.code);
    } catch (e) {

;      throw ServerException('');
    }
  }

  @override
  Future<Unit> updatePetData(PetModel petModel) async {
    final result = await FirebaseCollection.petCollectionName.collection
        .doc(petModel.id)
        .get();
    final ispetExist = result.exists;
    if (ispetExist) {
      try {
        await FirebaseCollection.petCollectionName.collection
            .doc(petModel.id)
            .update(
              petModel.toMap(),
            );
        return Future.value(unit);
      } on ServerException {
        throw ServerException('');
      }
    } else {
      throw DocumentNotExistException();
    }
  }

  @override
  Future<bool> ispetExist(String petID) async {
    try {
      final result = await FirebaseCollection.petCollectionName.collection
          .doc(petID)
          .get();
      return result.exists;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<XFile?> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  ) async {
    final ImagePicker picker = ImagePicker();
    XFile? media;
    switch (contentType) {
      case ContentType.image:
        media = await picker.pickImage(source: imageSource);
        break;
      case ContentType.video:
        media = await picker.pickVideo(source: imageSource);
        break;
      default:
        media = await picker.pickImage(source: imageSource);
    }
    return media;
  }

  @override
  Future<String> uploadFile(
    String filePath,
  ) async {
    
    final storageRef = FirebaseStorage.instance.ref();
    final String fileFormat = filePath.split('.').last;
    final String imageName = const Uuid().v1();

    final mountainsRef =
        storageRef.child("$fileFormat/messages/$imageName.$fileFormat");

    File file = File(filePath);

    try {
      await mountainsRef.putFile(file);

      String getDownloadURL = await mountainsRef.getDownloadURL();

      return getDownloadURL;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }
}
