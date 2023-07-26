import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/use_cases/client_use_cases/save_cached_client_info_use_case.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_event.dart';
import 'package:vets_project/features/authentication/presentation/bloc/client_signup_bloc/client_signup_state.dart';

import '../../../domain/use_cases/client_use_cases/client_signup_process_use_case.dart';

class ClientSignupBloc extends Bloc<ClientSignupEvent, ClientSignupState> {
  final ClientSignupProcessUseCase clientSignupProcessUseCase;
  SaveCachedClientInfoUseCase saveCachedClientInfoUseCase;
  ClientSignupBloc(
      {required this.clientSignupProcessUseCase,
      required this.saveCachedClientInfoUseCase})
      : super(ClientSignupInitial()) {
    on<ClientSignupEvent>((event, emit) async {
      if (event is Signup) {
        emit(ClientSignupLoading());
        Either<Failure, Unit> result =
            await clientSignupProcessUseCase.clientSignupProcess(
          event.clientEntity,
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
            saveCachedClientInfoUseCase.saveClientInfo(
              event.clientEntity,
            );

            emit(SignupSuccess());
          },
        );
      }
      if (kDebugMode) {
        print(event.runtimeType.toString());
      }
    });
  }

  ClientSignupState _mapFailureState(Failure failure) {
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
          return ClientSignupUnknownState();
        }
      case ServerFailure:
        {
          return AuthServerFailureState();
        }

      default:
        return ClientSignupUnknownState();
    }
  }
}
