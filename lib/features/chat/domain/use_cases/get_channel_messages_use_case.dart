import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class GetChannelMessagesUseCase {
  final ChatRepository chatRepository;

  GetChannelMessagesUseCase(this.chatRepository);

  Future<Either<Failure, List<MessageEntity>>> getChannelMessages(
      channelId) async {
    return await chatRepository.getChannelMessages(channelId);
  }
}
