import 'package:firebase_auth/firebase_auth.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/values/constant_strings.dart';

class FirebaseAuthExceptionConverter {


  static Exception stringToSignupException(
      FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case errorOperationNotAllowed:
        {
          return AuthErrorOperationNotAllowed();
        }

      case errorWeakPassword:
        {
          return AuthErrorWeakPassword();
        }

      case errorInvalidEmailSignup:
        {
          return AuthErrorInvalidEmailSignup();
        }

      case errorEmailAlreadyInUse:
        {
          return AuthErrorEmailAlreadyInUse();
        }

      case errorInvalidCredential:
        {
          return AuthErrorInvalidCredential();
        }

      default:
        return UnknownError();
    }
  }

  static Exception stringToSignInException(
      FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case errorInvalidEmailSignIn:
        {
          return AuthErrorInvalidEmailSignIn();
        }
      case errorWrongPassword:
        {
          return AuthErrorWrongPassword();
        }
      case prodUserNotFound:
        {
          return AuthErrorUserNotFound();
        }
      case errorUserDisabled:
        {
          return AuthErrorUserDisabled();
        }
      case errorTooManyRequests:
        {
          return AuthErrorTooManyRequests();
        }
      case errorOperationNotFound:
        {
          return AuthErrorOperationNotFound();
        }

      default:
        return UnknownError();
    }
  }
}
