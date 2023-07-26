import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/pick_image_usecase.dart';
import 'package:vets_project/features/pets_management/domain/use_cases/upload_image_usecase.dart';

part 'add_pet_state.dart';

class AddPetCubit extends Cubit<AddPetState> {
  String? name;
  String? age;
  String? genre;
  String? species;
  String? race;
  String? color;
  String? weight;
  String? petImagePath;
  String? petImageUrl;
  final UploadImageUseCase uploadImageUseCase;
  final PickImageUseCase pickImageUseCase;
  AddPetCubit(
      {required this.pickImageUseCase, required this.uploadImageUseCase})
      : super(AddPetInitial());

  bool nameIsValid(String value) {
    return value.length > 3;
  }

  void nameChanged(String value) {
    name = value;
    if (value.isEmpty) {
      emit(AddPetInitial());
    } else if (!nameIsValid(value)) {
      emit(InvalidName());
    } else {
      emit(AddPetInitial());
    }
  }

  bool ageIsValid(String value) {
    return value.length > 3;
  }

  void ageChanged(String value) {
    age = value;
  }

  void genreChanged(String value) {
    genre = value;
  }

  void speciesChanged(String value) {
    species = value;
  }

  void raceChanged(String value) {
    race = value;
  }

  void colorChanged(String value) {
    color = value;
  }

  void weightChanged(String value) {
    weight = value;
  }

  Future<void> pickImage() async {
    final result = await pickImageUseCase.pickFiles(
        ImageSource.gallery, ContentType.image);
    result.fold((l) => emit(InvalidPickedImage()), (r) {
      petImagePath = r!.path;
      emit(ImagePickSuccess(r.path));
    });
  }

  Future<void> uploadPicture(String filePath) async {
    emit(Loading());
    final result = await uploadImageUseCase.uploadFile(filePath);
    result.fold((l) => emit(ErrorUploadImage()), (r) {
      petImageUrl = r;
      emit(
        SuccessUploadImage(
          r,
        ),
      );
    });
  }
}
