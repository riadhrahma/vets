import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class AddNewPetUseCase {
  final PetsMangementRepository petsManagementRepository;
  const AddNewPetUseCase(this.petsManagementRepository);

  Future<Either<Failure, Unit>> addNewPet(PetEntity petEntity) async {
    return await petsManagementRepository.addNewPet(petEntity);
  }
}
