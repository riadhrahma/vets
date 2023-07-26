import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';

///*******************************
///never use modal, just entity
///******************************
abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIntWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, Unit>> signupWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, Unit>> fetchFcmToken();

  Future<Either<Failure, Unit>> logOut();

  //client methods
  Future<Either<Failure, Unit>> updateClientInfo(
    ClientEntity userEntity,
  );
  Future<Either<Failure, ClientEntity>> fetchClientInfo(
    String id,
  );
  Future<Either<Failure, Unit>> createClientInDataBase(
      ClientEntity clientEntity);
  Future<Either<Failure, Unit>> clientIsExist(
    String id,
  );
//veterinary methods
  Future<Either<Failure, Unit>> fetchVeterinaryInfo(
    String id,
  );
  Future<Either<Failure, Unit>> veterinaryIsExist(
    String id,
  );
  Future<Either<Failure, Unit>> createVeterinaryInDataBase(
    VeterinaryEntity veterinaryEntity,
  );
  Future<Either<Failure, Unit>> updateVeterinaryInfo(
    VeterinaryEntity veterinaryEntity,
  );

  Future<Either<Failure, Object>> signInProcess(
    String email,
    String password,
  );

  Future<Either<Failure, Unit>> veterinarySignupProcess(
    VeterinaryEntity veterinaryEntity,
    String password,
  );

  Future<Either<Failure, Unit>> clientSignupProcess(
      ClientEntity clientEntity,
      String password,
      );

  Future<Either<Failure, ClientModel>> getCachedClientInfo();
  Future<Either<Failure, Unit>> saveClientInfo(ClientEntity clientEntity);
  Future<Either<Failure, VeterinaryModel>> getCachedVeterinaryInfo();
  Future<Either<Failure, Unit>> saveVeterinaryInfo(VeterinaryEntity veterinaryEntity);

  Future<Either<Failure, Unit>> removeClientInfo();
  Future<Either<Failure, Unit>> removeVeterinaryInfo();
}
