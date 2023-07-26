import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChannelEntity>> createChannel(
      ChannelEntity channelEntity);

  Future<Either<Failure, List<ChannelEntity>>> getMyChannel(String userID);

  Future<Either<Failure, MessageEntity>> sendMessage(
      String channelID, MessageEntity messageEntity);

  Future<Either<Failure, List<MessageEntity>>> getMyMessages(String channelID);

  Future<Either<Failure, List<ChannelEntity>>> searchMyConversation(
      String userName);

  Future<Either<Failure, List<MessageEntity>>> searchMyMessages(
      String message, String channelID);

//// CHnage the date of conversation + change last Message //////////
  Future<Either<Failure, Unit>> updateMyChannelWithNewInputs(
      ChannelEntity channelEntity);

  Future<Either<Failure, Unit>> deleteConversation(String channelID);

  Future<Either<Failure, Unit>> deleteMessage(String messageID);
}
