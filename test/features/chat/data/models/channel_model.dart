// import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';

// class ChannelModel extends ChannelEntity {
//   const ChannelModel({
//     super.id,
//     required super.senderID,
//     required super.senderName,
//     required super.senderPhotURL,
//     required super.recentTextMessage,
//     required super.recipientsID,
//     required super.recipientName,
//     required super.createdAt,
//   });

//   factory ChannelModel.fromJson(Map<String, dynamic> json) {
//     return ChannelModel(
//       id: json['id'],
//       createdAt: json['createdAt'],
//       recentTextMessage: json['recentTextMessage'],
//       recipientName: json['recipientName'],
//       recipientsID: json['recipientsID'],
//       senderID: json['senderID'],
//       senderName: json['senderName'],
//       senderPhotURL: json['senderPhotURL'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'createdAt': createdAt,
//         'recentTextMessage': recentTextMessage,
//         'recipientName': recipientName,
//         'recipientsID': recipientsID,
//         'senderID': senderID,
//         'senderName': senderName,
//         'senderPhotURL': senderPhotURL,
//       };
// }
