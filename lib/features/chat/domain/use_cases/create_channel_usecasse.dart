import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class CreateChannelUseCase {
  final ChatRepository chatRepository;

  CreateChannelUseCase(this.chatRepository);

  Future<Either<Failure, Unit>> createChannel(
      ChannelEntity channelEntity) async {
    return await chatRepository.createChannel(channelEntity);
  }
}
