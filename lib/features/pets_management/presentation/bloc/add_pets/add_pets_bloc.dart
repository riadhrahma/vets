import 'package:bloc/bloc.dart';

import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/add_new_pet_usecase.dart';

part 'add_pets_event.dart';
part 'add_pets_state.dart';

class AddPetsBloc extends Bloc<AddPetsEvent, AddPetsState> {
  final AddNewPetUseCase addNewPetUseCase;

  AddPetsBloc( {

    required this.addNewPetUseCase,


  }) : super(AddPetsInitial()) {
    on<AddPetsEvent>((event, emit) async {

      if (event is AddPet) {
        final result = await addNewPetUseCase.addNewPet(
          event.petEntity,
        );
        result.fold((l) {
          emit(UnknownErrorSate());
        }, (r) {

          emit(AddPetsSuccessState());
        });
      }
    });
  }
}
