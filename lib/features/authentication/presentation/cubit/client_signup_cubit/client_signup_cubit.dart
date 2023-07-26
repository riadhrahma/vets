import 'package:bloc/bloc.dart';
import 'package:vets_project/features/authentication/presentation/cubit/client_signup_cubit/client_signup_state.dart';

class ClientSignupCubit extends Cubit<ClientSignupState> {
  String? profilePicture;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String gender = 'homme';
  String? address;
  bool isAssured = false;

  ClientSignupCubit() : super(ClientSignupInitial());

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.') && email.length > 3;
  }

  void emailChanged(String value) {
    email = value;
    if (value.isEmpty) {
      emit(ClientInvalidEmailSignInState());
    } else if (!emailIsValid(value)) {
      emit(ClientInvalidEmailSignInState());
    } else {
      emit(ClientSignupInitial());
    }
  }

  bool passwordIsValid(String email) {
    return email.length > 3;
  }

  void passwordChanged(String value) {
    password = value;
    if (value.isEmpty) {
      emit(ClientSignupInitial());
    } else if (!passwordIsValid(value)) {
      emit(ClientWrongPasswordState(password: value));
    } else {
      emit(ClientSignupInitial());
    }
  }

  bool firstNameIsValid(String value) {
    return value.length > 3;
  }

  void firstNameChanged(String value) {
    firstName = value;
    if (value.isEmpty) {
      emit(ClientSignupInitial());
    } else if (!firstNameIsValid(value)) {
      emit(ClientWrongFirstNameState(firstName: value));
    } else {
      emit(ClientSignupInitial());
    }
  }

  bool lastNameIsValid(String value) {
    return value.length > 3;
  }

  void lastNameChanged(String value) {
    lastName = value;
    if (value.isEmpty) {
      emit(ClientSignupInitial());
    } else if (!lastNameIsValid(value)) {
      emit(ClientWrongLastNameState(lastName: value));
    } else {
      emit(ClientSignupInitial());
    }
  }

  void genderChanged(value) {
    gender = value;
  }

  bool phoneNumberIsValid(String value) {
    final int? parseResult = int.tryParse(value);
    return value.length == 8 && parseResult != null;
  }

  void phoneNumberChanged(String value) {
    phoneNumber = value;
    if (value.isEmpty) {
      emit(ClientSignupInitial());
    } else if (!phoneNumberIsValid(value)) {
      emit(ClientWrongPhoneNumberState(phoneNumber: value));
    } else {
      emit(ClientSignupInitial());
    }
  }

  bool addressIsValid(value) {
    return value.length > 5;
  }

  void addressChanged(String value) {
    address = value;
    if (value.isEmpty) {
      emit(ClientSignupInitial());
    } else if (!addressIsValid(value)) {
      emit(ClientWrongAddressState(address: value));
    } else {
      emit(ClientSignupInitial());
    }
  }
}
