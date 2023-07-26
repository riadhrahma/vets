import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

abstract class PetsCachedDataSource {
  Future<List<PetModel>> getCachedPet();
  Future<Unit> savePets(List<PetModel> petModels);
}

class HiveCachedDataSource implements PetsCachedDataSource {
  @override
  Future<List<PetModel>> getCachedPet() async {
    final pets = await Hive.box('CachedPets').get('CachedPets');
    if (pets != null) {
      List data = json.decode(pets);
      List<PetModel> jsonToPetstModels = data
          .map<PetModel>((jsonPetModel) => PetModel.fromJson(jsonPetModel))
          .toList();
      return Future.value(jsonToPetstModels);
    } else {
      throw EmptyCachException();
    }
  }

  @override
  Future<Unit> savePets(List<PetModel> petModels) async {
    var box = await Hive.openBox('CachedPets');
    List pets = petModels.map((petModel) => petModel.toMap()).toList();
    box.addAll(pets);
    return Future.value(unit);
  }
}
