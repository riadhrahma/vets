import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vets_project/features/profile/domain/use_cases/update_profile_use_case.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  UpdateProfileBloc({required this.updateProfileUseCase})
      : super(UpdateProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) {});
  }
}
