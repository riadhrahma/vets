import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class UploadImageUseCase {
  final PetsMangementRepository petsMangementRepository;
  const UploadImageUseCase(this.petsMangementRepository);

  Future<Either<Failure, String>> uploadFile(String filePath) async {
    return await petsMangementRepository.uploadFile(filePath);
  }
}
