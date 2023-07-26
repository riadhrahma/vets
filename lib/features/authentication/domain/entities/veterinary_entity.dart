import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class VeterinaryEntity extends Equatable {
   String id;
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final bool isEmergencyAgent;
  final bool isConfirmed;
   String fcmToken;

   VeterinaryEntity(
      {required this.id,
      required this.profilePicture,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.isEmergencyAgent,
      required this.isConfirmed,
      required this.fcmToken});
  @override
  List<Object?> get props => [
        id,
        profilePicture,
        firstName,
        lastName,
        phoneNumber,
        email,
        isEmergencyAgent,
        isConfirmed,
        fcmToken
      ];
}
