import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';

abstract class CachedDataSource {
  Future<Unit> initCashedDb(Set<String> fields, String path);
  Future<ClientModel> getCachedClientInfo();
  Future<Unit> saveClientInfo(ClientModel clientModel);
  Future<VeterinaryModel> getCachedVeterinaryInfo();
  Future<Unit> saveVeterinaryInfo(VeterinaryModel veterinaryModel);

  Future<Unit> removeClientInfo();
  Future<Unit> removeVeterinaryInfo();
}

class CachedDataSourceImpl implements CachedDataSource {
  BoxCollection? collection;

  @override
  Future<ClientModel> getCachedClientInfo() async {
    try {
      final CollectionBox<Map<dynamic, dynamic>> dataBox =
          await collection!.openBox<Map>('client');

      final Map<dynamic, dynamic>? clientDataResult =
          await dataBox.get('client');
      if (clientDataResult == null) {
        throw ClientNotExistException();
      }

      return ClientModel.fromJson(clientDataResult);
    } on ClientNotExistException {
      rethrow;
    }
  }

  @override
  Future<VeterinaryModel> getCachedVeterinaryInfo() async {
    try {
      final CollectionBox<Map<dynamic, dynamic>> dataBox =
          await collection!.openBox<Map>('veterinary');

      final veterinaryDataResult = await dataBox.get('veterinary');
      if (veterinaryDataResult == null) {
        throw VeterinaryNotExistException();
      }

      return VeterinaryModel.fromJson(veterinaryDataResult);
    } on VeterinaryNotExistException {
      rethrow;
    }
  }

  @override
  Future<Unit> saveClientInfo(ClientModel clientModel) async {
    final CollectionBox<Map<dynamic, dynamic>> dataBox =
        await collection!.openBox<Map>('client');

    // Put something in
    await dataBox.put('client', clientModel.toJson());
    return unit;
  }

  @override
  Future<Unit> removeClientInfo() async {
    final CollectionBox<Map<dynamic, dynamic>> dataBox =
        await collection!.openBox<Map>('client');

    // Put something in
    await dataBox.clear();
    return unit;
  }

  @override
  Future<Unit> saveVeterinaryInfo(VeterinaryModel veterinaryModel) async {
    final CollectionBox<Map<dynamic, dynamic>> dataBox =
        await collection!.openBox<Map>('veterinary');

    // Put something in
    await dataBox.put('veterinary', veterinaryModel.toMap);
    return unit;
  }

  @override
  Future<Unit> removeVeterinaryInfo() async {
    final CollectionBox<Map<dynamic, dynamic>> dataBox =
        await collection!.openBox<Map>('veterinary');

    await dataBox.clear();
    return unit;
  }

  ///Nb this is the test version of initCashedDb
  @override
  Future<Unit> initCashedDb(Set<String> fields, String path) async {
    collection ??= await BoxCollection.open(
      'vets',
      fields,
      path: path,
    );
    return unit;
  }

  ///Nb this is the release version of initCashedDb
  //@override
  //Future<Unit> initCashedDb() async {
  //  final directory = await getApplicationDocumentsDirectory();
  //  Hive.init(directory.path);
  //  collection ??= await BoxCollection.open(
  //    'vets',
  //    {'veterinary', 'client'},
  //    path: directory.path,
  //  );
  //  return unit;
  //}
}
