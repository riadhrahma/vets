abstract class ClientSignupState {}

class ClientSignupInitial extends ClientSignupState {}

class ClientInvalidEmailSignupState extends ClientSignupState {
  final String? email;

  ClientInvalidEmailSignupState({this.email});
}

class AuthInitial extends ClientSignupState {}

class ClientInvalidEmailSignInState extends ClientSignupState {
  final String? email;

  ClientInvalidEmailSignInState({this.email});
}

class ClientWrongPasswordState extends ClientSignupState {
  final String? password;

  ClientWrongPasswordState({this.password});
}

class ClientWrongFirstNameState extends ClientSignupState {
  final String? firstName;

  ClientWrongFirstNameState({this.firstName});
}

class ClientWrongLastNameState extends ClientSignupState {
  final String? lastName;

  ClientWrongLastNameState({this.lastName});
}

class ClientWrongPhoneNumberState extends ClientSignupState {
  final String? phoneNumber;

  ClientWrongPhoneNumberState({this.phoneNumber});
}


class ClientWrongAddressState extends ClientSignupState {
  final String? address;

  ClientWrongAddressState({this.address});
}



