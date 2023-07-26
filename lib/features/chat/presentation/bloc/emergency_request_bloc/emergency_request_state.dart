part of 'emergency_request_bloc.dart';

abstract class EmergencyRequestState {}

class EmergencyRequestInitial extends EmergencyRequestState {}

class PetsLoadedResults extends EmergencyRequestState {
  final List<PetModel> pets;

  PetsLoadedResults(this.pets);
}

class LoadPetsFailed extends EmergencyRequestState {
  final String? error;

  LoadPetsFailed(this.error);
}

class CreateEmergencyRequestSuccess extends EmergencyRequestState {
  final String channelId;
  CreateEmergencyRequestSuccess(this.channelId);
}

class CreateEmergencyRequestFailed extends EmergencyRequestState {
  final String? error;
  CreateEmergencyRequestFailed({this.error});
}

class CreateChannelFailed extends EmergencyRequestState {
  final String? error;
  CreateChannelFailed({this.error});
}

class CreateChannelSuccess extends EmergencyRequestState {}
