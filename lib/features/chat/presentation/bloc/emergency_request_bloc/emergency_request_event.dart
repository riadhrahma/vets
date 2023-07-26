part of 'emergency_request_bloc.dart';

abstract class EmergencyRequestEvent {}

//action on the button confirm that shown on pop popup
class ClientConfirmEmergencyRequest extends EmergencyRequestEvent {
  final PetModel petModel;
  ClientConfirmEmergencyRequest({required this.petModel});
}

class LoadPets extends EmergencyRequestEvent {
  final String clientId;

  LoadPets(this.clientId);
}
