import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/util/firebase_auth_exception_converter.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';

abstract class AuthOnlineDataSource {
  //the same for all users
  Future<Unit> signInWithEmailAndPassword(String email, String password);
  Future<Unit> signupWithEmailAndPassword(String email, String password);
  Future<Unit> logOut();
  Future<String> fetchFcmToken();
//client methods
  Future<ClientModel> getClientInfo(String id);
  Future<bool> clientIsExist(String id);
  Future<Unit> createClientInDataBase(
    ClientModel clientModel,
  );
  Future<Unit> updateClientInfo(ClientModel clientModel);

  //veterinary methods
  Future<VeterinaryModel> getVeterinaryInfo(String id);
  Future<bool> veterinaryIsExist(String id);
  Future<Unit> createVeterinaryInDataBase(VeterinaryModel veterinaryModel);
  Future<Unit> updateVeterinaryInfo(VeterinaryModel veterinaryModel);
  Future<Object> signInProcess(String email, String password);
  Future<Unit> signupVeterinaryProcess(
      VeterinaryModel veterinaryModel, String password);
  Future<Unit> signupClientProcess(
      ClientModel veterinaryModel, String password);
}

class FirebaseDataSourceImpl implements AuthOnlineDataSource {
  // ignore: prefer_typing_uninitialized_variables
  final firestore;
  // ignore: prefer_typing_uninitialized_variables
  final auth;

  final CollectionReference<Map<String, dynamic>> veterinaryCollection;

  final CollectionReference<Map<String, dynamic>> clientCollection;

  late final User user;

  FirebaseDataSourceImpl(this.firestore, this.auth)
      : veterinaryCollection = firestore.collection('veterinary'),
        clientCollection = firestore.collection('client');

  @override
  Future<Unit> signInWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return unit;
    } on AuthErrorInvalidEmailSignIn {
      rethrow;
    } on AuthErrorWrongPassword {
      rethrow;
    } on AuthErrorUserNotFound {
      rethrow;
    } on AuthErrorUserDisabled {
      rethrow;
    } on AuthErrorTooManyRequests {
      rethrow;
    } on AuthErrorOperationNotFound {
      rethrow;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw throw FirebaseAuthExceptionConverter.stringToSignInException(e);
      }
      throw UnknownError();
    }
  }

  @override
  Future<Unit> signupWithEmailAndPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return unit;
    } on AuthErrorOperationNotAllowed {
      rethrow;
    } on AuthErrorWeakPassword {
      rethrow;
    } on AuthErrorInvalidEmailSignup {
      rethrow;
    } on AuthErrorEmailAlreadyInUse {
      rethrow;
    } on AuthErrorInvalidCredential {
      rethrow;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw throw FirebaseAuthExceptionConverter.stringToSignupException(e);
      }

      throw UnknownError();
    }
  }

  @override
  Future<Unit> logOut() async {
    try {
      assert(auth.currentUser != null);
      await auth.signOut();
      return unit;
    } on AssertionError {
      throw UserNotExistException();
    }
  }

  ///client methods

  @override
  Future<ClientModel> getClientInfo(String id) async {
    try {
      final result = await clientCollection.doc(id).get();
      final isExist = result.exists;
      if (isExist) {
        //if exist return the ClientModel that contain the Client data
        return ClientModel.fromJson(result.data()!);
      } else {
        //if is not exist throw the AuthUserNotExistException to tell us that no client exist with this is
        throw UserNotExistException();
      }
    } on UserNotExistException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<Unit> updateClientInfo(ClientModel clientModel) async {
    try {
      final bool isExist = await clientIsExist(clientModel.id);
      if (!isExist) {
        throw AuthUserNotExistException();
      }
      await clientCollection.doc(clientModel.id).update(clientModel.toJson());
      return unit;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } on AuthUserNotExistException {
      rethrow;
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<Unit> createClientInDataBase(
    ClientModel clientModel,
  ) async {
    try {
      final bool clientIsExist = await this.clientIsExist(clientModel.id);
      if (clientIsExist) {
        throw AuthUserExistException();
      }

      await clientCollection.doc(clientModel.id).set(
            clientModel.toJson(),
          );
      return unit;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } on AuthUserExistException {
      rethrow;
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<bool> clientIsExist(String id) async {
    try {
      final result = await clientCollection.doc(id).get();
      return result.exists;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  ///veterinary methods

  @override
  Future<VeterinaryModel> getVeterinaryInfo(String id) async {
    try {
      final result = await veterinaryCollection.doc(id).get();
      final isExist = result.exists;
      if (isExist) {
        //if exist return the VeterinaryModel that contain the veterinary data
        return VeterinaryModel.fromJson(result.data());
      } else {
        //if is not exist throw the AuthUserNotExistException to tell us that no veterinary exist with this is
        throw UserNotExistException();
      }
    } on UserNotExistException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<Unit> createVeterinaryInDataBase(
      VeterinaryModel veterinaryModel) async {
    try {
      final bool veterinaryIsExist =
          await this.veterinaryIsExist(veterinaryModel.id);
      if (veterinaryIsExist) {
        throw AuthUserExistException();
      }

      await veterinaryCollection.doc(veterinaryModel.id).set(
            veterinaryModel.toMap,
          );
      return unit;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } on AuthUserExistException {
      rethrow;
    } //catch (e) {
    //throw UnknownError();
    //}
  }

  @override
  Future<Unit> updateVeterinaryInfo(VeterinaryModel veterinaryModel) async {
    try {
      final bool isExist = await veterinaryIsExist(veterinaryModel.id);
      if (!isExist) {
        throw AuthUserNotExistException();
      }
      await veterinaryCollection.doc(veterinaryModel.id).update(
            veterinaryModel.toMap,
          );
      return unit;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } on AuthUserNotExistException {
      rethrow;
    } //catch (e) {
    //throw UnknownError();
    //}
  }

  @override
  Future<bool> veterinaryIsExist(String id) async {
    try {
      final result = await veterinaryCollection.doc(id).get();
      return result.exists;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } //catch (e) {
    //throw UnknownError();
    //}
  }

  @override
  Future<String> fetchFcmToken() async {
    try {
      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      final String? fcmToken = await messaging.getToken();
      if (fcmToken != null) {
        return fcmToken;
      } else {
        throw NullFcmTokenException();
      }
    } on NullFcmTokenException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } //catch (e) {
    //throw UnknownError();
    //}
  }

  @override
  Future<Object> signInProcess(String email, String password) async {
    try {
      await signInWithEmailAndPassword(email, password);

      final String userUid = auth.currentUser!.uid;
      final bool isVeterinary = await veterinaryIsExist(userUid);

      if (isVeterinary) {
        //veterinary process
        return await getVeterinaryInfo(userUid);
      } else {
        //client process
        return await getClientInfo(userUid);
      }
    } on AuthErrorInvalidEmailSignIn {
      throw AuthErrorInvalidEmailSignIn();
    } on AuthErrorWrongPassword {
      throw AuthErrorWrongPassword();
    } on AuthErrorUserNotFound {
      throw AuthErrorUserNotFound();
    } on AuthErrorUserDisabled {
      throw AuthErrorUserDisabled();
    } on AuthErrorTooManyRequests {
      throw AuthErrorTooManyRequests();
    } on AuthErrorOperationNotFound {
      throw AuthErrorOperationNotFound();
    } on ServerException catch (e) {
      throw ServerException(e.code);
    } on UserNotExistException {
      throw AuthErrorUserNotFound();
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw throw FirebaseAuthExceptionConverter.stringToSignInException(e);
      }

      throw UnknownError();
    }
  }

  @override
  Future<Unit> signupVeterinaryProcess(
      VeterinaryModel veterinaryModel, String password) async {
    try {
      await signupWithEmailAndPassword(veterinaryModel.email, password);
      final userIdResult = auth.currentUser?.uid;
      veterinaryModel.setId = userIdResult;
      final String fcmTokenResult = await fetchFcmToken();
      veterinaryModel.setFcmToken = fcmTokenResult;
      createVeterinaryInDataBase(veterinaryModel);
      return unit;
    } on AuthErrorInvalidEmailSignup {
      rethrow;
    } on AuthErrorEmailAlreadyInUse {
      rethrow;
    } on AuthErrorWeakPassword {
      rethrow;
    } on AuthErrorInvalidCredential {
      rethrow;
    } //catch (e) {
    //   throw UnknownError();
    // }
  }

  @override
  Future<Unit> signupClientProcess(
      ClientModel clientModel, String password) async {
    try {
      await signupWithEmailAndPassword(clientModel.email, password);
      final userIdResult = auth.currentUser?.uid;
      clientModel.setId = userIdResult;
      final String fcmTokenResult = await fetchFcmToken();
      clientModel.setFcmToken = fcmTokenResult;
      createClientInDataBase(clientModel);
      return unit;
    } on AuthErrorInvalidEmailSignup {
      rethrow;
    } on AuthErrorEmailAlreadyInUse {
      rethrow;
    } on AuthErrorWeakPassword {
      rethrow;
    } on AuthErrorInvalidCredential {
      rethrow;
    } catch (e) {
      throw UnknownError();
    }
  }
}
