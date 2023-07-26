import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

class GetMyPetsUseCase {
  final ChatRepository chatRepository;

  GetMyPetsUseCase(this.chatRepository);

  Future<Either<Failure, List<PetModel>>> getMyPets(String clientId) async {
    return await chatRepository.getMyPets(clientId);
  }
}
