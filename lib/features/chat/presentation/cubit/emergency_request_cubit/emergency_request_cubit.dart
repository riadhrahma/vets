import 'package:bloc/bloc.dart';

import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

part 'emergency_request_state.dart';

class EmergencyRequestCubit extends Cubit<EmergencyRequestState> {
  PetModel? selectedPet;
  EmergencyRequestCubit() : super(EmergencyRequestInitial());

  void onAnimalSelect({required PetModel value}) {
    selectedPet = value;
    emit(PetSelectedState(value));
  }
}
