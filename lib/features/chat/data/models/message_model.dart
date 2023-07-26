import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';

import 'message_content_model.dart';

// ignore: must_be_immutable
class MessageModel extends MessageEntity {
   MessageModel({
    required super.id,
    required super.senderID,
    required super.sendAt,
    required super.senderRole,
    required super.recipientID,
    required super.messageContentModel,
    required super.channelID,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sendAt: (json['sendAt'] as Timestamp).toDate(),
      senderID: json['senderID'],
      senderRole: json['senderRole'],
      recipientID: json['recipientID'],
      messageContentModel:
          MessageContentModel.formJson(json['messageContent']),
      channelID: json['channelID'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'sendAt': sendAt,
        'senderID': senderID,
        'senderRole': senderRole,
        'recipientID': recipientID,
        'messageContent': messageContentModel.toMap,
        'channelID': channelID,
      };

  set setMessageContent(value){
    messageContentModel=value;
  }
}
