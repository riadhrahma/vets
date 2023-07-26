import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';

class GetPetsUseCase {
  final PetsMangementRepository petsMangementRepository;
  const GetPetsUseCase(this.petsMangementRepository);

  Future<Either<Failure, List<PetEntity>>> call(String clientID) async {
    return await petsMangementRepository.getMyPets(clientID);
  }
}
