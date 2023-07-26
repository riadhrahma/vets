import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vets_project/features/chat/domain/use_cases/create_new_emergency_request_process_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/get_my_pets_usecase.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

part 'emergency_request_event.dart';
part 'emergency_request_state.dart';

class EmergencyRequestBloc
    extends Bloc<EmergencyRequestEvent, EmergencyRequestState> {
  final GetMyPetsUseCase getMyPetsUseCase;

  final CreateNewEmergencyRequestProcessUseCase
      createNewEmergencyRequestProcessUseCase;
  EmergencyRequestBloc({
    required this.createNewEmergencyRequestProcessUseCase,
    required this.getMyPetsUseCase,
  }) : super(EmergencyRequestInitial()) {
    on<EmergencyRequestEvent>((event, emit) async {
      print(state);
      if (event is ClientConfirmEmergencyRequest) {
        final result = await createNewEmergencyRequestProcessUseCase
            .createNewEmergencyRequestProcess(
          event.petModel.id,
          FirebaseAuth.instance.currentUser!.uid,
        );
        result.fold((l) {
          emit(CreateEmergencyRequestFailed());
        }, (r) {
          print(r);
          emit(CreateEmergencyRequestSuccess(r));
        });
      }
      if (event is LoadPets) {
        final result = await getMyPetsUseCase.getMyPets(event.clientId);

        result.fold((l) {
          emit(LoadPetsFailed(l.runtimeType.toString()));
        }, (r) {
          emit(PetsLoadedResults(r));
        });
      }
    });
  }
}
