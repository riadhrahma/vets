import 'dart:convert';

import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';

// ignore: must_be_immutable
class VeterinaryModel extends VeterinaryEntity {
  static const String _id = 'id';
  static const String _profilePicture = 'profilePicture';
  static const String _firstName = 'firstName';
  static const String _lastName = 'lastName';
  static const String _phoneNumber = 'phoneNumber';
  static const String _email = 'email';
  static const String _isEmergencyAgent = 'isEmergencyAgent';
  static const String _isConfirmed = 'isConfirmed';
  static const String _fcmToken = 'fcmToken';

  VeterinaryModel(
      {required super.id,
      required super.profilePicture,
      required super.firstName,
      required super.lastName,
      required super.phoneNumber,
      required super.email,
      required super.isEmergencyAgent,
      required super.isConfirmed,
      required super.fcmToken});

  Map<String, dynamic> get toMap => {
        _id: id,
        _profilePicture: profilePicture,
        _firstName: firstName,
        _lastName: lastName,
        _phoneNumber: phoneNumber,
        _email: email,
        _isEmergencyAgent: isEmergencyAgent,
        _isConfirmed: isConfirmed,
        _fcmToken: fcmToken,
      };
  String get toJson => jsonEncode(toMap);

  VeterinaryEntity get getVeterinaryEntity => VeterinaryEntity(
        id: id,
        profilePicture: profilePicture,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        isEmergencyAgent: isEmergencyAgent,
        isConfirmed: isConfirmed,
        fcmToken: fcmToken,
      );

  set setId(value) {
    id = value;
  }

  set setFcmToken(value) {
    fcmToken = value;
  }

  factory VeterinaryModel.fromJson(json) {
    return VeterinaryModel(
      id: json[_id],
      profilePicture: json[_profilePicture],
      firstName: json[_firstName],
      lastName: json[_lastName],
      phoneNumber: json[_phoneNumber],
      email: json[_email],
      isEmergencyAgent: json[_isEmergencyAgent],
      isConfirmed: json[_isConfirmed],
      fcmToken: json[_fcmToken],
    );
  }
}
