part of 'chat_tools_cubit.dart';

@immutable
abstract class ChatToolsState {}

class ChatToolsInitial extends ChatToolsState {}

class RecordSound extends ChatToolsState {}

class RecordSoundFinished extends ChatToolsState {
  final String recordPath;

  RecordSoundFinished(this.recordPath);
}

class MessageTypeFinished extends ChatToolsState {
  final String message;

  MessageTypeFinished(this.message);
}

class PickDocument extends ChatToolsState {}

class PickImage extends ChatToolsState {}

class PickVideo extends ChatToolsState {}

class DeleteMessage extends ChatToolsState {
  final String messageId;
  DeleteMessage(this.messageId);
}

class ReplyToMessage extends ChatToolsState {
  final MessageModel messageModel;
  ReplyToMessage(this.messageModel);
}
