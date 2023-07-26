import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/get_pet_list_usecase.dart';

part 'get_my_pets_event.dart';
part 'get_my_pets_state.dart';

class GetMyPetsBloc extends Bloc<GetMyPetsEvent, GetMyPetsState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GetPetsUseCase getPetsUseCase;
  GetMyPetsBloc({required this.getPetsUseCase}) : super(GetMyPetsInitial()) {
    on<GetMyPetsEvent>((event, emit) async {
      if (event is GetAllMyPetsEvent) {
        emit(LoadingPetsState());
        final failureOrPets = await getPetsUseCase(auth.currentUser!.uid);
        // emit(_mapFailureToMessage(failureOrPets));
      } else if (event is RefreshPetsEvent) {
        emit(LoadingPetsState());
        final failureOrPets = await getPetsUseCase(auth.currentUser!.uid);
        // emit(_mapFailureToMessage(failureOrPets));
      }
    });
  }
  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServeurFailure:
  //       return 'SERVER_FAILURE_MESSAGE';
  //     case EmptyCacheFailure:
  //       return 'EMPTY_CACHE_FAILURE_MESSAGE';
  //     case InternetFailure:
  //       return 'OFFLINE_FAILURE_MESSAGE';
  //     default:
  //       return "Unexpected Error , Please try again later .";
  //   }
  // }
}
