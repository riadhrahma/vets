import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class CreateNewEmergencyRequestProcessUseCase {
  final ChatRepository chatRepository;

  CreateNewEmergencyRequestProcessUseCase(this.chatRepository);

  Future<Either<Failure, String>> createNewEmergencyRequestProcess(
      petId, clientId) async {
    return await chatRepository.createNewEmergencyRequestProcess(
        petId, clientId);
  }
}
