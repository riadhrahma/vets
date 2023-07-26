import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/entities/emergency_request_entity.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class CreateEmergencyRequestUseCase {
  final ChatRepository chatRepository;

  CreateEmergencyRequestUseCase(this.chatRepository);

  Future<Either<Failure, Unit>> createEmergencyRequest(
      EmergencyRequestEntity emergencyRequestEntity) async {
    return await chatRepository.createEmergencyRequest(emergencyRequestEntity);
  }
}