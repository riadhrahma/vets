abstract class ClientSignupState {}

class ClientSignupInitial extends ClientSignupState {}

class ClientSignupLoading extends ClientSignupState {}

class ClientSignupUnknownState extends ClientSignupState {}

class AuthErrorOperationNotAllowedState extends ClientSignupState {}

class AuthServerFailureState extends ClientSignupState {}

class SignupSuccess extends ClientSignupState {}

class AuthErrorWeakPasswordState extends ClientSignupState {}

class AuthErrorInvalidEmailSignupState extends ClientSignupState {}

class AuthErrorEmailAlreadyInUseState extends ClientSignupState {}

class AuthErrorInvalidCredentialState extends ClientSignupState {}

class UpdateClientSuccess extends ClientSignupState {}

class UpdateClientFailed extends ClientSignupState {
  final String? error;

  UpdateClientFailed(this.error);
}
