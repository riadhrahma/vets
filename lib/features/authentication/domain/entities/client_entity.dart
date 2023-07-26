import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ClientEntity extends Equatable {
  String id;
  final String? clinicID;
  final String email;
  final String name;
  final String lastName;
  final String photoUrl;
  final int phoneNumber;
  final String address;
  final String role;
  final bool? isVip;
  final String? clientCode;
  final bool isEmergencyAgent;
  String gender;
  String fcmToken;

  ClientEntity({
    required this.id,
    required this.address,
    this.clinicID,
    required this.email,
    required this.lastName,
    required this.name,
    required this.phoneNumber,
    required this.photoUrl,
    this.clientCode,
    required this.role,
    required this.isVip,
    required this.isEmergencyAgent,
    required this.fcmToken,
    required this.gender,
  });
  @override
  List<Object?> get props => [
        id,
        clinicID,
        email,
        name,
        lastName,
        phoneNumber,
        photoUrl,
        address,
        clientCode,
        role,
        isVip,
        isEmergencyAgent,
        fcmToken,
        gender,
      ];
}
