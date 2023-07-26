part of 'veterinary_signup_bloc.dart';

@immutable
abstract class VeterinarySignupState {}

class VeterinarySignupInitial extends VeterinarySignupState {}
class VeterinarySignupUnknownState extends VeterinarySignupState {}
class AuthErrorOperationNotAllowedState extends VeterinarySignupState {}
class AuthServerFailureState extends VeterinarySignupState{}
class SignupSuccess extends VeterinarySignupState{}

class AuthErrorWeakPasswordState extends VeterinarySignupState {}

class AuthErrorInvalidEmailSignupState extends VeterinarySignupState {}

class AuthErrorEmailAlreadyInUseState extends VeterinarySignupState {}

class AuthErrorInvalidCredentialState extends VeterinarySignupState {}


