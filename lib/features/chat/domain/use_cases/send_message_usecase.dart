import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository chatRepository;

  SendMessageUseCase(this.chatRepository);

  Future<Either<Failure, Unit>> sendMessage(MessageEntity messageEntity) async {
    return await chatRepository.sendMessage(messageEntity);
  }
}
