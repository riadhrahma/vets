import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';

///*******************************
///never use modal, just entity
///******************************
abstract class ProfileRepository {
  Future<Either<Failure, Unit>> updateProfile(
    ClientEntity clientEntity,
  );

}
