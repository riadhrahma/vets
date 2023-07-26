

abstract class SignInState {
  const SignInState();
}

class AuthInitial extends SignInState {}

class AuthLoading extends SignInState {}

class AuthErrorInvalidEmailSignInState extends SignInState {
  final String? email;

  const AuthErrorInvalidEmailSignInState({this.email});
}

class AuthErrorWrongPasswordState extends SignInState {
  final String? password;

  const AuthErrorWrongPasswordState({this.password});
}

class AuthErrorUserNotFoundState extends SignInState {}

class AuthErrorUserDisabledState extends SignInState {}

class AuthErrorTooManyRequestsState extends SignInState {}

class AuthErrorOperationNotFoundState extends SignInState {}

class AuthUnknownErrorState extends SignInState {}

class AuthServerFailureState extends SignInState {}

class AuthSuccess extends SignInState {}

class IsVeterinary extends SignInState {}

class IsClient extends SignInState {}
