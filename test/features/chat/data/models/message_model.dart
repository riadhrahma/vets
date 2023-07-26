// import 'package:vets_project/features/chat/domain/entities/message_entity.dart';

// class MessageModel extends MessageEntity {
//   const MessageModel({
//     required super.id,
//     required super.messageDate,
//     required super.senderID,
//     required super.senderName,
//     required super.recipientID,
//     required super.recepientName,
//     required super.chatMessageType,
//     required super.isRead,
//     required super.messageTime,
//     required super.channelID,
//   });
//   factory MessageModel.fromJson(Map<String, dynamic> json) {
//     return MessageModel(
//       id: json['id'],
//       messageDate: json['messageDate'],
//       senderID: json['senderID'],
//       senderName: json['senderName'],
//       recipientID: json['recipientID'],
//       recepientName: json['recepientName'],
//       chatMessageType: json['chatMessageType'],
//       isRead: json['isRead'],
//       messageTime: json['messageTime'],
//       channelID: json['channelID'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'messageDate': messageDate,
//         'senderID': senderID,
//         'senderName': senderName,
//         'recipientID': recipientID,
//         'recepientName': recepientName,
//         'chatMessageType': chatMessageType,
//         'isRead': isRead,
//         'messageTime': messageTime,
//         'channelID': channelID,
//       };
// }
