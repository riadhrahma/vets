import 'package:equatable/equatable.dart';
import 'package:vets_project/features/chat/data/models/message_content_model.dart';

// ignore: must_be_immutable
class SubMessageEntity extends Equatable {
  final String id;
  final String messageId;
  final DateTime sendAt;
  final String senderID;
  final String recipientID;
  final String senderRole;
  final String channelID;
  MessageContentModel messageContentModel;

  SubMessageEntity({
    required this.id,
    required this.senderID,
    required this.recipientID,
    required this.messageContentModel,
    required this.channelID,
    required this.senderRole,
    required this.sendAt,
    required this.messageId,
  });
  @override
  List<Object?> get props => [
        id,
        sendAt,
        senderRole,
        senderID,
        recipientID,
        channelID,
        messageId,
      ];
}
