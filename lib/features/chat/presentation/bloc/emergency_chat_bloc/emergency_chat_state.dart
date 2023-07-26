part of 'emergency_chat_bloc.dart';


abstract class EmergencyChatState {}

class EmergencyChatInitial extends EmergencyChatState {}

class SendTextMessageFailed extends EmergencyChatState {}

class SendTextMessageSuccess extends EmergencyChatState {}

class SendVocalMessageFailed extends EmergencyChatState {}

class SendVocalMessageSuccess extends EmergencyChatState {}

class SendVideoMessageFailed extends EmergencyChatState {}

class SendVideoMessageSuccess extends EmergencyChatState {}

class SendImageMessageSuccess extends EmergencyChatState {}

class SendImageMessageFailed extends EmergencyChatState {}


class SendDocumentMessageSuccess extends EmergencyChatState {}

class SendDocumentMessageFailed extends EmergencyChatState {}

class GetChannelMessagesSuccess extends EmergencyChatState {
  final List<MessageEntity> messages;

  GetChannelMessagesSuccess(this.messages);
}

class GetChannelMessagesFailed extends EmergencyChatState {}


class DeleteMessageSuccess extends EmergencyChatState{}


class DeleteMessageFailed extends EmergencyChatState{}

