abstract class VeterinarySignupState {}

class VeterinarySignupInitial extends VeterinarySignupState {}

class VeterinaryInvalidEmailSignupState extends VeterinarySignupState {
  final String? email;

  VeterinaryInvalidEmailSignupState({this.email});
}

class AuthInitial extends VeterinarySignupState {}

class VeterinaryInvalidEmailSignInState extends VeterinarySignupState {
  final String? email;

  VeterinaryInvalidEmailSignInState({this.email});
}

class VeterinaryWrongPasswordState extends VeterinarySignupState {
  final String? password;

  VeterinaryWrongPasswordState({this.password});
}

class VeterinaryWrongFirstNameState extends VeterinarySignupState {
  final String? firstName;

  VeterinaryWrongFirstNameState({this.firstName});
}

class VeterinaryWrongLastNameState extends VeterinarySignupState {
  final String? lastName;

  VeterinaryWrongLastNameState({this.lastName});
}

class VeterinaryWrongPhoneNumberState extends VeterinarySignupState {
  final String? phoneNumber;

  VeterinaryWrongPhoneNumberState({this.phoneNumber});
}
