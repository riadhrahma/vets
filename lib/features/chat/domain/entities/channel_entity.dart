import 'package:equatable/equatable.dart';

class ChannelEntity extends Equatable {
  final String id;
  final String clientID;
  final String animalId;
  final List vetsID;
  final DateTime createdAt;
  final bool isEmergency;
  //@ToDo emergency request Model to store emergency data such as  localisation of client / vet /
  final String? emergencyRequestID;
  const ChannelEntity({
    required this.id,
    required this.clientID,
    required this.vetsID,
    required this.createdAt,
    required this.animalId,
    required this.isEmergency,
    this.emergencyRequestID,
  });

  @override
  List<Object?> get props => [
        id,
        clientID,
        vetsID,
        createdAt,
        animalId,
        isEmergency,
        emergencyRequestID
      ];
}
