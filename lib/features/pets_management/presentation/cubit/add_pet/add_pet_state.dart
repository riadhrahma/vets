part of 'add_pet_cubit.dart';


abstract class AddPetState {}

class Loading extends AddPetState {}

class AddPetInitial extends AddPetState {}

class InvalidName extends AddPetState {}

class InvalidAge extends AddPetState {}

class InvalidGenre extends AddPetState {}

class InvalidSpecies extends AddPetState {}

class InvalidRace extends AddPetState {}

class InvalidColor extends AddPetState {}

class InvalidWeight extends AddPetState {}

class InvalidPickedImage extends AddPetState {}

class ImagePickSuccess extends AddPetState {
  final String imagePath;

  ImagePickSuccess(this.imagePath);
}

class ErrorUploadImage extends AddPetState {}

class SuccessUploadImage extends AddPetState {
  final String imageUrl;

  SuccessUploadImage(this.imageUrl);
}
