import 'package:flutter_test/flutter_test.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/features/authentication/data/data_sources/cached_data_source.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';

main() async {
  ///NB: read lib/features/authentication/data/data_sources/cached_data_source.dart:89
  ///change the local db path

  final CachedDataSourceImpl cachedDataSourceImpl = CachedDataSourceImpl();
  await cachedDataSourceImpl.initCashedDb({'veterinary', 'client'}, './');
  group('cachedDataSourceImpl', () {
    test(
      'save veterinary data in cache',
      () async {
        final VeterinaryModel veterinaryModel = VeterinaryModel(
          id: 'id',
          profilePicture: "profilePicture",
          firstName: "firstName",
          lastName: "lastName",
          phoneNumber: "phoneNumber",
          email: "email",
          isEmergencyAgent: true,
          isConfirmed: true,
          fcmToken: "fcmToken",
        );
        await cachedDataSourceImpl.saveVeterinaryInfo(veterinaryModel);
        VeterinaryModel veterinaryModelFromCash =
            await cachedDataSourceImpl.getCachedVeterinaryInfo();

        expect(
          veterinaryModelFromCash,
          veterinaryModel,
          reason:
              'after the executing [saveVeterinaryInfo] method, the [getCachedVeterinaryInfo] must find a veterinary with id equal ${veterinaryModelFromCash.id} ',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'save client data in cache',
      () async {
        final ClientModel clientModel = ClientModel(
          id: 'id',
          address: 'address',
          email: 'email',
          lastName: 'lastName',
          name: 'name',
          phoneNumber: 29670128,
          photoUrl: 'photoUrl',
          isVip: true,
          role: 'role',
          clientCode: 'clientCode',
          fcmToken: 'fcmToken',
          isEmergencyAgent: false,
        );
        await cachedDataSourceImpl.saveClientInfo(clientModel);
        ClientModel clientModelFromCash =
            await cachedDataSourceImpl.getCachedClientInfo();
        expect(
          clientModelFromCash,
          clientModel,
          reason:
              'after the executing [saveClientInfo] method, the [getCachedClientInfo] must find a client with id equal ${clientModelFromCash.id} ',
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'exceptions client data in cache',
      () async {
        await cachedDataSourceImpl.removeClientInfo();

        expect(
          () async => await cachedDataSourceImpl.getCachedClientInfo(),
          throwsA(isA<ClientNotExistException>()),
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );

    test(
      'exceptions veterinary data in cache',
      () async {
        await cachedDataSourceImpl.removeVeterinaryInfo();

        expect(
          () async => await cachedDataSourceImpl.getCachedVeterinaryInfo(),
          throwsA(isA<VeterinaryNotExistException>()),
        );
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1000,
        ),
      ),
    );
  });
}
