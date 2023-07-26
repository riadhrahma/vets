import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/pets_management/domain/entities/pet_entity.dart';

abstract class PetsMangementRepository {
  ///////////////// Client Methods //////////////////////////
  Future<Either<Failure, Unit>> addNewPet(PetEntity petEntity);
  Future<Either<Failure, List<PetEntity>>> getMyPets(String clientID);
  Future<Either<Failure, Unit>> updatePetData(PetEntity petEntity);
  Future<Either<Failure, Unit>> deleteMyPet(String petID);

  Future<Either<Failure, XFile?>> pickFiles(
      ImageSource imageSource,
      ContentType contentType,
      );
  Future<Either<Failure, String>> uploadFile(
      String filePath,
      );

}
