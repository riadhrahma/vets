import 'package:dartz/dartz.dart';

import 'package:vets_project/core/common_used/network_Info/network_info.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/pets_management/data/data_sources/remote_data_source.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';
import 'package:vets_project/features/pets_management/domain/repositories/pet_management_repository.dart';
import 'package:image_picker/image_picker.dart';

typedef DeleteOrUpdateOrAddPets = Future<Unit> Function();

class PetsMangementRepositoryImpl implements PetsMangementRepository {
  final PetManagmentRemoteDataSource petManagmentRemoteDataSource;
  //final PetsCachedDataSource petsCachedDataSource;
  final NetworkInfo networkInfo;

  PetsMangementRepositoryImpl({
    required this.networkInfo,
    required this.petManagmentRemoteDataSource,
    //required this.petsCachedDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addNewPet(PetEntity petEntity) async {
    final PetModel petModel = PetModel(
      id: petEntity.id,
      name: petEntity.name,
      age: petEntity.age,
      species: petEntity.species,
      breed: petEntity.breed,
      color: petEntity.color,
      weight: petEntity.weight,
      gender: petEntity.gender,
      photoURL: petEntity.photoURL,
      ownerID: petEntity.ownerID,
      doctorsID: petEntity.doctorsID,
    );
    return await _getMessage(() {
      return petManagmentRemoteDataSource.addNewPet(petModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteMyPet(String petID) async {
    return await _getMessage(() {
      return petManagmentRemoteDataSource.deleteMyPet(petID);
    });
  }

  @override
  Future<Either<Failure, List<PetEntity>>> getMyPets(String clientID) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePets =
            await petManagmentRemoteDataSource.getMyPets(clientID);
        //petsCachedDataSource.savePets(remotePets);
        return Right(remotePets);
      } on ServerException {
        return left(ServerFailure(''));
      }
    }
    //  else {
    //    try {
    //      //final localPets = await petsCachedDataSource.getCachedPet();
    //      return Right(localPets);
    //    } on EmptyCachException {
    //      return left(EmptyCacheFailure());
    //    }
    //  }

    throw Exception();
  }

  @override
  Future<Either<Failure, Unit>> updatePetData(PetEntity petEntity) async {
    final PetModel petModel = PetModel(
      id: petEntity.id,
      name: petEntity.name,
      age: petEntity.age,
      species: petEntity.species,
      breed: petEntity.breed,
      color: petEntity.color,
      weight: petEntity.weight,
      gender: petEntity.gender,
      photoURL: petEntity.photoURL,
      ownerID: petEntity.ownerID,
      doctorsID: petEntity.doctorsID,
    );
    return await _getMessage(() {
      return petManagmentRemoteDataSource.updatePetData(petModel);
    });
  }

///////////////////////////////////////////////////////////////////////
  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPets deleteOrUpdateOrAddPets) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPets();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure(''));
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, XFile?>> pickFiles(
      ImageSource imageSource, ContentType contentType) async {
    try {
      final result = await petManagmentRemoteDataSource.pickFiles(
          imageSource, contentType);
      return right(result);
    } on UnknownError {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(String filePath) async {
    try {
      final result = await petManagmentRemoteDataSource.uploadFile(filePath);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.code));
    } on UnknownError {
      return left(UnknownFailure());
    }
  }
}
