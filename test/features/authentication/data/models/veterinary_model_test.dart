import 'package:flutter_test/flutter_test.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';

main() {
  group('veterinary model test', () {
    test('entity test', () {
      final VeterinaryModel veterinaryModel = VeterinaryModel(
        id: 'id',
        profilePicture: 'profilePicture',
        firstName: 'firstName',
        lastName: 'lastName',
        phoneNumber: 'phoneNumber',
        email: 'email',
        isEmergencyAgent: true,
        isConfirmed: true,
        fcmToken: 'fcmToken',
      );

      expect(veterinaryModel, isA<VeterinaryEntity>());
    });

    test('map io test', () {
      final Map<String, dynamic> map = {
        'id': 'id',
        'profilePicture': 'profilePicture',
        'firstName': 'firstName',
        'lastName': 'lastName',
        'phoneNumber': 'phoneNumber',
        'email': 'email',
        'isEmergencyAgent': true,
        'isConfirmed': true,
        'fcmToken': 'fcmToken',
      };
      final VeterinaryModel veterinaryModel = VeterinaryModel.fromJson(map);
      //final Map<String, dynamic> result = veterinaryModel.toMap;
      expect(VeterinaryModel.fromJson(map), isA<VeterinaryEntity>());

      veterinaryModel.setId = 'id example';
      expect(veterinaryModel.id, 'id example');

      veterinaryModel.setFcmToken = 'fcm example';
      expect(veterinaryModel.fcmToken, 'fcm example');

      expect(veterinaryModel.toJson, isA<String>());
      expect(veterinaryModel.getVeterinaryEntity, isA<VeterinaryEntity>());
    });
  });
}
