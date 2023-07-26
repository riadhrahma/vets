part of 'add_pets_bloc.dart';

abstract class AddPetsEvent {}

class AddPet extends AddPetsEvent {
  final PetEntity petEntity;
  AddPet(this.petEntity);
}
