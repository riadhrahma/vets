import 'package:dartz/dartz.dart';
import 'package:vets_project/features/chat/data/models/channel_model.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';

abstract class ChatOnlineDataSource {
  Future<Unit> createChannel(ChannelModel channelModel);
  Future<Unit> sendMessage(String channelID, MessageModel messageModel);
  Future<List<ChannelModel>> getMyConversations(String userID);
  Future<List<MessageModel>> getMyMessages(String channelID);
  Future<Unit> updateMyChannel(ChannelModel channelModel);
  Future<Unit> deleteConversation(String channelID);
  Future<Unit> deleteMessage(String messageID);
  Future<List<ChannelModel>> searchConversation(String userName);
  Future<List<MessageModel>> searchMessage(String message, String channelID);
}
