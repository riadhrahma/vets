import 'package:bloc/bloc.dart';
import 'package:vets_project/features/authentication/presentation/cubit/veterinary_signup_cubit/veterinary_signup_state.dart';

class VeterinarySignupCubit extends Cubit<VeterinarySignupState> {
  //todo add the the profile picture  when the design is completed
  //String?  profilePicture: 'profilePicture',
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  VeterinarySignupCubit() : super(VeterinarySignupInitial());

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.') && email.length > 3;
  }

  void emailChanged(String value) {
    email = value;
    if (value.isEmpty) {
      emit(VeterinaryInvalidEmailSignInState());
    } else if (!emailIsValid(value)) {
      emit(VeterinaryInvalidEmailSignInState());
    } else {
      emit(VeterinarySignupInitial());
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
      emit(VeterinaryWrongPasswordState(password: value));
    } else {
      emit(AuthInitial());
    }
  }

  bool firstNameIsValid(String value) {
    return value.length > 3;
  }

  void firstNameChanged(String value) {
    firstName = value;
    if (value.isEmpty) {
      emit(AuthInitial());
    } else if (!firstNameIsValid(value)) {
      emit(VeterinaryWrongFirstNameState(firstName: value));
    } else {
      emit(AuthInitial());
    }
  }

  bool lastNameIsValid(String value) {
    return value.length > 3;
  }

  void lastNameChanged(String value) {
    lastName = value;
    if (value.isEmpty) {
      emit(AuthInitial());
    } else if (!lastNameIsValid(value)) {
      emit(VeterinaryWrongLastNameState(lastName: value));
    } else {
      emit(AuthInitial());
    }
  }

  bool phoneNumberIsValid(String value) {
    return value.length > 3;
  }

  void phoneNumberChanged(String value) {
    phoneNumber = value;
    if (value.isEmpty) {
      emit(AuthInitial());
    } else if (!phoneNumberIsValid(value)) {
      emit(VeterinaryWrongPhoneNumberState(phoneNumber: value));
    } else {
      emit(AuthInitial());
    }
  }
}
