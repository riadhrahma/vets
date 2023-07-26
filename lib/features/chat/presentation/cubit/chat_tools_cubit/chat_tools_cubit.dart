import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';

part 'chat_tools_state.dart';

class ChatToolsCubit extends Cubit<ChatToolsState> {
  String? messageValue;
  final RecorderController recorderController = RecorderController();

  ChatToolsCubit() : super(ChatToolsInitial());

  Stream<QuerySnapshot> messagesStream(String channelId) {
    return FirebaseFirestore.instance
        .collection('message')
        .where('channelID', isEqualTo: channelId)
        .orderBy('sendAt', descending: true)
        .snapshots();
  }

  void initState() {
    emit(ChatToolsInitial());
  }

  void messageTextSubmit(String value) {
    emit(MessageTypeFinished(value));
  }

  void pickDocument() {
    emit(PickDocument());
  }

  void pickImage() {
    emit(PickImage());
  }

  void pickVideo() {
    emit(PickVideo());
  }

  void deleteMessage(String messageId) {
    print(messageId);
    emit(DeleteMessage(messageId));
  }

  Future<void> startRecord() async {
    await recorderController.record();
    emit(RecordSound());
  }

  Future<void> stopRecord() async {
    String? recordPath = await recorderController.stop();
    emit(RecordSoundFinished(recordPath!));
  }

  void replyToMessage(MessageModel messageModel) {
    emit(
      ReplyToMessage(
        messageModel,
      ),
    );
  }
}
