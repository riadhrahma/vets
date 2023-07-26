import 'package:flutter_test/flutter_test.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';

main() {
  group('client model test', () {
    test('entity test', () {
      final ClientModel clientModel = ClientModel(
        isEmergencyAgent: false,
        id: 'id',
        address: 'address',
        email: 'email',
        lastName: 'lastName',
        name: 'name',
        phoneNumber: 216215555,
        photoUrl: 'photoUrl',
        isVip: false,
        role: 'role',
        clientCode: 'clientCode',
        fcmToken: 'fcmToken',
      );


      expect(clientModel, isA<ClientEntity>());
    });

    test('map io test', () {
      final Map<String, dynamic> map = {
        'id': 'id',
        'clinicID': 'null',
        'address': 'address',
        'email': 'email',
        'lastName': 'lastName',
        'name': 'name',
        'phoneNumber': 216215555,
        'photoUrl': 'photoUrl',
        'isVip': false,
        'role': 'role',
        'clientCode': 'clientCode',
        'isEmergencyAgent': false,
        'fcmToken': 'fcmToken',
      };

      final ClientModel clientModel = ClientModel.fromJson(map);
      final Map<String, dynamic> result = clientModel.toJson();

      expect(ClientModel.fromJson(result), isA<ClientEntity>());

      clientModel.setFcmToken='fcm test';
      expect(clientModel.fcmToken, 'fcm test');
      clientModel.setId='id example';
      expect(clientModel.id, 'id example');
      expect(clientModel.getClientEntity, isA<ClientEntity>());
    });
  });
}
