import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';

class ChannelModel extends ChannelEntity {
  static const String idKey = 'id';
  static const String _animalId = 'animalId';
  static const String clientIDKey = 'clientId';
  static const String _emergencyRequestID = 'emergencyRequestId';
  static const String _isEmergency = 'isEmergency';
  static const String vetsIDKey = 'vetsID';
  static const String _createdAt = 'createdAt';

  const ChannelModel({
    required super.id,
    required super.animalId,
    required super.clientID,
    required super.emergencyRequestID,
    required super.isEmergency,
    required super.vetsID,
    required super.createdAt,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      id: json[idKey],
      createdAt: (json[_createdAt] as Timestamp).toDate(),
      clientID: json[clientIDKey],
      emergencyRequestID: json[_emergencyRequestID],
      isEmergency: json[_isEmergency],
      vetsID: json[vetsIDKey],
      animalId: json[_animalId],
    );
  }
  Map<String, dynamic> toJson() => {
        idKey: id,
        _createdAt: createdAt,
        clientIDKey: clientID,
        _emergencyRequestID: emergencyRequestID,
        _isEmergency: isEmergency,
        vetsIDKey: vetsID,
        _animalId: animalId,
      };
}
