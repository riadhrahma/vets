import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';
import 'package:vets_project/features/authentication/domain/use_cases/client_use_cases/get_cached_client_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/client_use_cases/save_cached_client_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/common_use_cases/signIn_proccess_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/get_cached_veterinary_info_use_case.dart';
import 'package:vets_project/features/authentication/domain/use_cases/veterinary_use_cases/save_cached_veterinary_info_use_case.dart';
import 'package:vets_project/features/authentication/presentation/cubit/sign_in_state.dart';

class SignInBloc extends Cubit<SignInState> {
  final SignInProcessUseCase signInProcessUseCase;
  final GetCachedClientInfoUseCase getCachedClientInfoUseCase;
  final GetCachedVeterinaryInfoUseCase getCachedVeterinaryInfoUseCase;
  final SaveCachedClientInfoUseCase saveCachedClientInfoUseCase;
  final SaveCachedVeterinaryInfoUseCase saveCachedVeterinaryInfoUseCase;
  String? email;
  String? password;

  SignInBloc({
    required this.signInProcessUseCase,
    required this.getCachedClientInfoUseCase,
    required this.getCachedVeterinaryInfoUseCase,
    required this.saveCachedClientInfoUseCase,
    required this.saveCachedVeterinaryInfoUseCase,
  }) : super(AuthInitial());

  Future<void> veterinaryLoginEvent() async {
    if (email != null && password != null && state is AuthInitial) {
      emit(AuthLoading());
      Either<Failure, Object> result =
          await signInProcessUseCase.signInProcess(email!, password!);
      result.fold(failureHandling, successHandling);
    } else {
      return;
    }
  }

  failureHandling(Failure l) {
    emit(_mapFailureState(l));
  }

  successHandling(Object r) {
    debugPrint(r.runtimeType.toString());
    if (r is VeterinaryModel) {
      saveCachedVeterinaryInfoUseCase
          .saveCachedVeterinaryInfo(r.getVeterinaryEntity);
      emit(IsVeterinary());
    } else if (r is ClientModel) {
      saveCachedClientInfoUseCase.saveClientInfo(r.getClientEntity);
      emit(IsClient());
    }
    emit(AuthSuccess());
  }

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.') && email.length > 3;
  }

  void emailChanged(String value) {
    email = value;
    if (value.isEmpty) {
      emit(AuthInitial());
    } else if (!emailIsValid(value)) {
      emit(AuthErrorInvalidEmailSignInState(email: value));
    } else {
      emit(AuthInitial());
    }
  }

  bool passwordIsValid(String email) {
    return email.length > 3;
  }

  void passwordChanged(String value) {
    password = value;
    if (value.isEmpty) {
      emit(AuthInitial());
    } else if (!passwordIsValid(value)) {
      emit(AuthErrorWrongPasswordState(password: value));
    } else {
      emit(AuthInitial());
    }
  }

  SignInState _mapFailureState(Failure failure) {
    debugPrint(failure.runtimeType.toString());
    switch (failure.runtimeType) {
      case AuthErrorInvalidEmailSignInFailure:
        {
          return const AuthErrorInvalidEmailSignInState();
        }

      case AuthErrorWrongPasswordFailure:
        {
          return const AuthErrorWrongPasswordState();
        }
      case AuthErrorUserNotFoundFailure:
        {
          return AuthErrorUserNotFoundState();
        }
      case AuthErrorUserDisabledFailure:
        {
          return AuthErrorUserDisabledState();
        }
      case AuthErrorTooManyRequestsFailure:
        {
          return AuthErrorTooManyRequestsState();
        }
      case AuthErrorOperationNotFoundFailure:
        {
          return AuthErrorOperationNotFoundState();
        }
      case UnknownFailure:
        {
          return AuthUnknownErrorState();
        }
      case ServerFailure:
        {
          return AuthServerFailureState();
        }

      default:
        return AuthInitial();
    }
  }
}
