part of 'emergency_request_cubit.dart';

abstract class EmergencyRequestState {}

class EmergencyRequestInitial extends EmergencyRequestState {}

class PetSelectedState extends EmergencyRequestState {
  final PetModel petModel;

  PetSelectedState(this.petModel);
}
