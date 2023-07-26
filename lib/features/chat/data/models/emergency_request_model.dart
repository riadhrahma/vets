import 'package:vets_project/features/chat/data/models/user_location_model.dart';
import 'package:vets_project/features/chat/domain/entities/emergency_request_entity.dart';

// ignore: must_be_immutable
class EmergencyRequestModel extends EmergencyRequestEntity {
  static const _id = 'id';
  static const _petId = 'petId';
  static const _clientLocation = 'clientLocation';
  static const _veterinaryLocation = 'veterinaryLocation';
  static const _veterinaryId = 'veterinaryId';
  EmergencyRequestModel({
    required super.id,
    required super.petId,
    required super.clientLocation,
    required super.veterinaryLocation,
    required super.veterinaryId,
  });

  set setVeterinaryId(value) {
    veterinaryId = value;
  }

  set setPetId(value) {
    petId = value;
  }

  set setClientLocation(value) {
    clientLocation = value;
  }

  set setVeterinaryLocation(value) {
    veterinaryLocation = value;
  }

  Map<String, dynamic> get toMap => {
        _id: id,
        _petId: petId,
        _clientLocation: clientLocation.toMap,
        _veterinaryLocation: veterinaryLocation.toMap,
        _veterinaryId: veterinaryId,
      };

  factory EmergencyRequestModel.fromMap(map) {
    return EmergencyRequestModel(
      id: map[_id],
      petId: map[_petId],
      clientLocation: UserLocationModel.fromMap(map[_clientLocation]),
      veterinaryLocation: UserLocationModel.fromMap(map[_veterinaryLocation]),
      veterinaryId: map[_veterinaryId],
    );
  }
}
