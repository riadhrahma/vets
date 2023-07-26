import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/save_cached_veterinary_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/veterinary_signup_process_use_case.dart';

part 'veterinary_signup_event.dart';
part 'veterinary_signup_state.dart';

class VeterinarySignupBloc
    extends Bloc<VeterinarySignupEvent, VeterinarySignupState> {
  final VeterinarySignupProcessUseCase veterinarySignupProcessUseCase;
  SaveCachedVeterinaryInfoUseCase saveCachedVeterinaryInfoUseCase;
  VeterinarySignupBloc({
    required this.veterinarySignupProcessUseCase,
    required this.saveCachedVeterinaryInfoUseCase,
  }) : super(VeterinarySignupInitial()) {
    on<VeterinarySignupEvent>((event, emit) async {
      if (event is VeterinarySignup) {
        Either<Failure, Unit> result =
            await veterinarySignupProcessUseCase.veterinarySignupProcess(
          event.veterinaryEntity,
          event.password,
        );
        result.fold(
          (Failure l) {
            if (kDebugMode) {
              print('failed with: ${l.runtimeType}');
            }

            emit(_mapFailureState(l));
          },
          (Unit r) {
            if (kDebugMode) {
              print('success with: ${r.runtimeType}');
            }

            emit(SignupSuccess());
          },
        );
      }
      if (kDebugMode) {
        print(event.runtimeType.toString());
      }
    });
  }

  VeterinarySignupState _mapFailureState(Failure failure) {
    switch (failure.runtimeType) {
      case AuthErrorOperationNotAllowedFailure:
        {
          return AuthErrorOperationNotAllowedState();
        }

      case AuthErrorWeakPasswordFailure:
        {
          return AuthErrorWeakPasswordState();
        }
      case AuthErrorInvalidEmailSignupFailure:
        {
          return AuthErrorInvalidEmailSignupState();
        }
      case AuthErrorEmailAlreadyInUseFailure:
        {
          return AuthErrorEmailAlreadyInUseState();
        }
      case AuthErrorInvalidCredentialFailure:
        {
          return AuthErrorInvalidCredentialState();
        }

      case UnknownFailure:
        {
          return VeterinarySignupUnknownState();
        }
      case ServerFailure:
        {
          return AuthServerFailureState();
        }

      default:
        return VeterinarySignupUnknownState();
    }
  }
}
