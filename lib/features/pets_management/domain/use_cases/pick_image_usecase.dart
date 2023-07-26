import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class PickImageUseCase {
  final PetsMangementRepository petsMangementRepository;
  const PickImageUseCase(this.petsMangementRepository);

  Future<Either<Failure, XFile?>> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  ) async {
    return await petsMangementRepository.pickFiles(
      imageSource,
      contentType,
    );
  }
}
