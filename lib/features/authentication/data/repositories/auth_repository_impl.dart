import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vets_project/core/common_used/network_Info/network_info.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/data/data_sources/cached_data_source.dart';
import 'package:vets_project/features/authentication/data/data_sources/remote_data_source.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource authOnlineDataSource;
  final CachedDataSource cachedDataSource;
  final NetworkInfo networkInfo;
  AuthRepositoryImpl({
    required this.authOnlineDataSource,
    required this.cachedDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ClientEntity>> fetchClientInfo(String id) async {
    if (await networkInfo.isConnected) {
      ClientModel clientModel = await authOnlineDataSource.getClientInfo(id);
      return right(clientModel);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIntWithEmailAndPassword(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        await authOnlineDataSource.signInWithEmailAndPassword(email, password);
        return right(unit);
      } on AuthServerException {
        return left(AuthServerFailure());
      } on AuthErrorInvalidEmailSignIn {
        return left(AuthErrorInvalidEmailSignInFailure());
      } on AuthErrorWrongPassword {
        return left(AuthErrorWrongPasswordFailure());
      } on AuthErrorUserNotFound {
        return left(AuthErrorUserNotFoundFailure());
      } on AuthErrorUserDisabled {
        return left(AuthErrorUserDisabledFailure());
      } on AuthErrorTooManyRequests {
        return left(AuthErrorTooManyRequestsFailure());
      } on AuthErrorOperationNotFound {
        return left(AuthErrorOperationNotFoundFailure());
      } on UnknownError {
        return left(UnknownFailure());
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signupWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await authOnlineDataSource.signupWithEmailAndPassword(
          email,
          password,
        );
        return right(unit);
      } on AuthServerException {
        return left(AuthServerFailure());
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateClientInfo(
      ClientEntity clientEntity) async {
    ClientModel userModel = ClientModel(
      gender: clientEntity.gender,
      address: clientEntity.address,
      email: clientEntity.email,
      lastName: clientEntity.lastName,
      name: clientEntity.name,
      phoneNumber: clientEntity.phoneNumber,
      photoUrl: clientEntity.photoUrl,
      isVip: clientEntity.isVip,
      role: clientEntity.role,
      id: clientEntity.id,
      clinicID: clientEntity.clinicID,
      clientCode: clientEntity.clientCode,
      isEmergencyAgent: clientEntity.isEmergencyAgent,
      fcmToken: clientEntity.fcmToken,
    );
    if (await networkInfo.isConnected) {
      try {
        await authOnlineDataSource.updateClientInfo(userModel);
        return right(unit);
      } on AuthServerException {
        return left(AuthServerFailure());
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    if (await networkInfo.isConnected) {
      await authOnlineDataSource.logOut();
      return right(unit);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clientIsExist(String id) async {
    if (await networkInfo.isConnected) {
      await authOnlineDataSource.clientIsExist(id);
      return right(unit);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createClientInDataBase(
      ClientEntity clientEntity) async {
    if (await networkInfo.isConnected) {
      ClientModel clientModel = ClientModel(
        gender: clientEntity.gender,
        address: clientEntity.address,
        email: clientEntity.email,
        lastName: clientEntity.lastName,
        name: clientEntity.name,
        phoneNumber: clientEntity.phoneNumber,
        photoUrl: clientEntity.photoUrl,
        isVip: clientEntity.isVip,
        role: clientEntity.role,
        id: clientEntity.id,
        clinicID: clientEntity.clinicID,
        clientCode: clientEntity.clientCode,
        isEmergencyAgent: clientEntity.isEmergencyAgent,
        fcmToken: clientEntity.fcmToken,
      );
      await authOnlineDataSource.createClientInDataBase(clientModel);
      return right(unit);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createVeterinaryInDataBase(
      VeterinaryEntity veterinaryEntity) async {
    if (await networkInfo.isConnected) {
      VeterinaryModel veterinaryModel = VeterinaryModel(
        id: veterinaryEntity.id,
        profilePicture: veterinaryEntity.profilePicture,
        firstName: veterinaryEntity.firstName,
        lastName: veterinaryEntity.lastName,
        phoneNumber: veterinaryEntity.phoneNumber,
        email: veterinaryEntity.email,
        isEmergencyAgent: veterinaryEntity.isEmergencyAgent,
        isConfirmed: veterinaryEntity.isConfirmed,
        fcmToken: veterinaryEntity.fcmToken,
      );
      await authOnlineDataSource.createVeterinaryInDataBase(veterinaryModel);
      return right(unit);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> fetchFcmToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.getToken();
      return right(unit);
    } on NullFcmTokenException {
      return left(NullFcmTokenFailure());
    } on ServerException catch (e) {
      return left(ServerFailure(e.code));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> fetchVeterinaryInfo(String id) async {
    if (await networkInfo.isConnected) {
      await authOnlineDataSource.getVeterinaryInfo(id);
      return right(unit);
    } else {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateVeterinaryInfo(
      VeterinaryEntity veterinaryEntity) async {
    VeterinaryModel veterinaryModel = VeterinaryModel(
      id: veterinaryEntity.id,
      profilePicture: veterinaryEntity.profilePicture,
      firstName: veterinaryEntity.firstName,
      lastName: veterinaryEntity.lastName,
      phoneNumber: veterinaryEntity.phoneNumber,
      email: veterinaryEntity.email,
      isEmergencyAgent: veterinaryEntity.isEmergencyAgent,
      isConfirmed: veterinaryEntity.isConfirmed,
      fcmToken: veterinaryEntity.fcmToken,
    );
    if (await networkInfo.isConnected) {
      try {
        await authOnlineDataSource.updateVeterinaryInfo(veterinaryModel);
        return right(unit);
      } on AuthServerException {
        return left(AuthServerFailure());
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> veterinaryIsExist(String id) async {
    if (await networkInfo.isConnected) {
      await authOnlineDataSource.veterinaryIsExist(id);
      return right(unit);
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Object>> signInProcess(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await authOnlineDataSource.signInProcess(email, password);
        return right(result);
      } on AuthServerException {
        return left(AuthServerFailure());
      } on AuthErrorInvalidEmailSignIn {
        return left(AuthErrorInvalidEmailSignInFailure());
      } on AuthErrorWrongPassword {
        return left(AuthErrorWrongPasswordFailure());
      } on AuthErrorUserNotFound {
        return left(AuthErrorUserNotFoundFailure());
      } on AuthErrorUserDisabled {
        return left(AuthErrorUserDisabledFailure());
      } on AuthErrorTooManyRequests {
        return left(AuthErrorTooManyRequestsFailure());
      } on AuthErrorOperationNotFound {
        return left(AuthErrorOperationNotFoundFailure());
      } on UnknownError {
        return left(UnknownFailure());
      } on ServerException catch (e) {
        return left(ServerFailure(e.code));
      } on UserNotExistException {
        return left(VeterinaryNotExistFailure());
      } catch (e) {
        return left(UnknownFailure());
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> veterinarySignupProcess(
      VeterinaryEntity veterinaryEntity, String password) async {
    try {
      VeterinaryModel veterinaryModel = VeterinaryModel(
        id: veterinaryEntity.id,
        profilePicture: veterinaryEntity.profilePicture,
        firstName: veterinaryEntity.firstName,
        lastName: veterinaryEntity.lastName,
        phoneNumber: veterinaryEntity.phoneNumber,
        email: veterinaryEntity.email,
        isEmergencyAgent: veterinaryEntity.isEmergencyAgent,
        isConfirmed: veterinaryEntity.isConfirmed,
        fcmToken: veterinaryEntity.fcmToken,
      );
      await authOnlineDataSource.signupVeterinaryProcess(
          veterinaryModel, password);
      return right(unit);
    } on AuthErrorOperationNotAllowed {
      return left(AuthErrorOperationNotAllowedFailure());
    } on AuthErrorWeakPassword {
      return left(AuthErrorWeakPasswordFailure());
    } on AuthErrorInvalidEmailSignup {
      return left(AuthErrorInvalidEmailSignupFailure());
    } on AuthErrorEmailAlreadyInUse {
      return left(AuthErrorEmailAlreadyInUseFailure());
    } on AuthErrorInvalidCredential {
      return left(AuthErrorInvalidCredentialFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clientSignupProcess(
      ClientEntity clientEntity, String password) async {
    try {
      ClientModel clientModel = ClientModel(
        address: clientEntity.address,
        email: clientEntity.email,
        lastName: clientEntity.lastName,
        name: clientEntity.name,
        phoneNumber: clientEntity.phoneNumber,
        photoUrl: clientEntity.photoUrl,
        isVip: clientEntity.isVip,
        role: clientEntity.role,
        id: clientEntity.id,
        clinicID: clientEntity.clinicID,
        clientCode: clientEntity.clientCode,
        isEmergencyAgent: clientEntity.isEmergencyAgent,
        fcmToken: clientEntity.fcmToken,
        gender: clientEntity.gender,
      );
      await authOnlineDataSource.signupClientProcess(clientModel, password);
      return right(unit);
    } on AuthErrorOperationNotAllowed {
      return left(AuthErrorOperationNotAllowedFailure());
    } on AuthErrorWeakPassword {
      return left(AuthErrorWeakPasswordFailure());
    } on AuthErrorInvalidEmailSignup {
      return left(AuthErrorInvalidEmailSignupFailure());
    } on AuthErrorEmailAlreadyInUse {
      return left(AuthErrorEmailAlreadyInUseFailure());
    } on AuthErrorInvalidCredential {
      return left(AuthErrorInvalidCredentialFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, ClientModel>> getCachedClientInfo() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      return left(InternetFailure());
    }
    try {
      final ClientModel clientModel =
          await cachedDataSource.getCachedClientInfo();
      return right(clientModel);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, VeterinaryModel>> getCachedVeterinaryInfo() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      return left(InternetFailure());
    }
    try {
      final VeterinaryModel veterinaryModel =
          await cachedDataSource.getCachedVeterinaryInfo();
      return right(veterinaryModel);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeClientInfo() async {
    try {
      await cachedDataSource.removeClientInfo();
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeVeterinaryInfo() async {
    try {
      await cachedDataSource.removeVeterinaryInfo();
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveClientInfo(
      ClientEntity clientEntity) async {
    try {
      ClientModel clientModel = ClientModel(
        gender: clientEntity.gender,
        address: clientEntity.address,
        email: clientEntity.email,
        lastName: clientEntity.lastName,
        name: clientEntity.name,
        phoneNumber: clientEntity.phoneNumber,
        photoUrl: clientEntity.photoUrl,
        isVip: clientEntity.isVip,
        role: clientEntity.role,
        id: clientEntity.id,
        clinicID: clientEntity.clinicID,
        clientCode: clientEntity.clientCode,
        isEmergencyAgent: clientEntity.isEmergencyAgent,
        fcmToken: clientEntity.fcmToken,
      );
      await cachedDataSource.saveClientInfo(clientModel);
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveVeterinaryInfo(
      VeterinaryEntity veterinaryEntity) async {
    try {
      VeterinaryModel veterinaryModel = VeterinaryModel(
        id: veterinaryEntity.id,
        profilePicture: veterinaryEntity.profilePicture,
        firstName: veterinaryEntity.firstName,
        lastName: veterinaryEntity.lastName,
        phoneNumber: veterinaryEntity.phoneNumber,
        email: veterinaryEntity.email,
        isEmergencyAgent: veterinaryEntity.isEmergencyAgent,
        isConfirmed: veterinaryEntity.isConfirmed,
        fcmToken: veterinaryEntity.fcmToken,
      );
      await cachedDataSource.saveVeterinaryInfo(veterinaryModel);
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
