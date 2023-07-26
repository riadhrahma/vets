import 'package:equatable/equatable.dart';
import 'package:vets_project/features/chat/data/models/user_location_model.dart';

// ignore: must_be_immutable
class EmergencyRequestEntity extends Equatable {
  String id;
  String petId;
  UserLocationModel clientLocation;
  UserLocationModel veterinaryLocation;
  String veterinaryId;

  EmergencyRequestEntity({
    required this.id,
    required this.petId,
    required this.clientLocation,
    required this.veterinaryLocation,
    required this.veterinaryId,
  });

  @override
  List<Object?> get props => [
        id,
        petId,
        clientLocation,
        veterinaryLocation,
        veterinaryId,
      ];
}
