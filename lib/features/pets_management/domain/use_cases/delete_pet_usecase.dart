import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class DeletePetUseCase {
  final PetsMangementRepository petsMangementRepository;
  const DeletePetUseCase(this.petsMangementRepository);

  Future<Either<Failure, Unit>> deletePet(String petID) async {
    return await petsMangementRepository.deleteMyPet(petID);
  }
}
