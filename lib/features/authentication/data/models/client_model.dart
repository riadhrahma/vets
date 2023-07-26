import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';

// ignore: must_be_immutable
class ClientModel extends ClientEntity {
  ClientModel(
      {required super.id,
      super.clinicID,
      required super.address,
      required super.email,
      required super.lastName,
      required super.name,
      required super.phoneNumber,
      required super.photoUrl,
      required super.isVip,
      required super.role,
      required super.clientCode,
      required super.isEmergencyAgent,
      required super.fcmToken,
      required super.gender});

  factory ClientModel.fromJson(json) {
    return ClientModel(
        id: json['id'],
        clinicID: json['clinicID'],
        address: json['address'],
        email: json['email'],
        lastName: json['lastName'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        photoUrl: json['photoUrl'],
        isVip: json['isVip'],
        role: json['role'],
        clientCode: json['clientCode'],
        isEmergencyAgent: json['isEmergencyAgent'],
        fcmToken: json['fcmToken'],
        gender: json['gender']);
  }

  set setId(value) {
    id = value;
  }

  set setFcmToken(value) {
    fcmToken = value;
  }

  set setGender(value) {
    gender = value;
  }

  ClientEntity get getClientEntity => ClientEntity(
      id: id,
      clinicID: clinicID,
      address: address,
      email: email,
      lastName: lastName,
      name: name,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      isVip: isVip,
      role: role,
      clientCode: clientCode,
      isEmergencyAgent: isEmergencyAgent,
      fcmToken: fcmToken,
      gender: gender);

  Map<String, dynamic> toJson() => {
        'id': id,
        'clinicID': clinicID,
        'address': address,
        'email': email,
        'lastName': lastName,
        'name': name,
        'phoneNumber': phoneNumber,
        'photoUrl': photoUrl,
        'isVip': isVip,
        'role': role,
        'clientCode': clientCode,
        'isEmergencyAgent': isEmergencyAgent,
        'fcmToken': fcmToken,
        gender: gender,
      };
}
