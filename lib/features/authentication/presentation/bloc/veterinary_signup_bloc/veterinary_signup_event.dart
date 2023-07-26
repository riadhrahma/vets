part of 'veterinary_signup_bloc.dart';

@immutable
abstract class VeterinarySignupEvent {}

class VeterinarySignup extends VeterinarySignupEvent {
  final VeterinaryEntity veterinaryEntity;
  final String password;

  VeterinarySignup(this.veterinaryEntity, this.password);
}
