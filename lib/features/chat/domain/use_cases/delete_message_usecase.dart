import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class DeleteMessageUseCase {
  final ChatRepository chatRepository;

  DeleteMessageUseCase(this.chatRepository);

  Future<Either<Failure, Unit>> deleteMessage(messageId) async {
    return await chatRepository.deleteMessage(
      messageId,
    );
  }
}
