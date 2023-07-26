part of 'emergency_chat_bloc.dart';

abstract class EmergencyChatEvent {}

class GetChannelMessages extends EmergencyChatEvent {
  final String channelId;

  GetChannelMessages(this.channelId);
}

class SendVocalMessageEvent extends EmergencyChatEvent {
  final String channelId;
  final String vocalPath;

  SendVocalMessageEvent(this.channelId, this.vocalPath);
}

class SendVideoMessageEvent extends EmergencyChatEvent {
  final String channelId;

  SendVideoMessageEvent(this.channelId);
}

class SendImageMessageEvent extends EmergencyChatEvent {
  final String channelId;

  SendImageMessageEvent(this.channelId);
}

class SendTexMessageEvent extends EmergencyChatEvent {
  final String channelId, message;

  SendTexMessageEvent(this.channelId, this.message);
}

class SendDocumentMessageEvent extends EmergencyChatEvent {
  final String channelId;

  SendDocumentMessageEvent(
    this.channelId,
  );
}

class DeleteMessageEvent extends EmergencyChatEvent {
  final String messageId;

  DeleteMessageEvent(this.messageId);
}
