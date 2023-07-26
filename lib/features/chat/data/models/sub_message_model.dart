import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vets_project/features/chat/domain/entities/sub_message_entity.dart';

import 'message_content_model.dart';

// ignore: must_be_immutable
class SubMessageModel extends SubMessageEntity {
  SubMessageModel({
    required super.id,
    required super.senderID,
    required super.sendAt,
    required super.senderRole,
    required super.recipientID,
    required super.messageContentModel,
    required super.channelID,
    required super.messageId,
  });
  factory SubMessageModel.fromJson(Map<String, dynamic> json) {
    return SubMessageModel(
        id: json['id'],
        sendAt: (json['sendAt'] as Timestamp).toDate(),
        senderID: json['senderID'],
        senderRole: json['senderRole'],
        recipientID: json['recipientID'],
        messageContentModel:
            MessageContentModel.formJson(json['messageContent']),
        channelID: json['channelID'],
        messageId: json['messageId']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'sendAt': sendAt,
        'senderID': senderID,
        'senderRole': senderRole,
        'recipientID': recipientID,
        'messageContent': messageContentModel.toMap,
        'channelID': channelID,
        'messageId': messageId,
      };

  set setMessageContent(value) {
    messageContentModel = value;
  }
}
