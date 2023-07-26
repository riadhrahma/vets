import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class UpdatePetDataUseCase {
  final PetsMangementRepository petsMangementRepository;
  const UpdatePetDataUseCase(this.petsMangementRepository);

  Future<Either<Failure, Unit>> updatePetData(PetEntity petEntity) async {
    return await petsMangementRepository.updatePetData(petEntity);
  }
}
