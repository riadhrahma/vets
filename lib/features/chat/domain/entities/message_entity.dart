import 'package:equatable/equatable.dart';
import 'package:vets_project/features/chat/data/models/message_content_model.dart';

// ignore: must_be_immutable
class MessageEntity extends Equatable {
  final String id;
  final DateTime sendAt;
  final String senderID;
  final String recipientID;
  final String senderRole;
  final String channelID;
  MessageContentModel messageContentModel;

  MessageEntity({
    required this.id,
    required this.senderID,
    required this.recipientID,
    required this.messageContentModel,
    required this.channelID,
    required this.senderRole,
    required this.sendAt,
  });
  @override
  List<Object?> get props => [
        id,
        sendAt,
        senderRole,
        senderID,
        recipientID,
        channelID,
      ];
}
