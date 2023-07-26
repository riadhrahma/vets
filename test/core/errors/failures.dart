import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class InternetFailure extends Failure {}

class AuthServerFailure extends Failure {}

class AuthWrongDataFailure extends Failure {}

class AuthEmptyCacheFailure extends Failure {}

class AuthUserExistFailure extends Failure {}

class AuthUserNotExistFailure extends Failure {}

//signup errors
class AuthErrorOperationNotAllowed extends Failure {}

class AuthErrorWeakPassword extends Failure {}

class AuthErrorInvalidEmailSignup extends Failure {}

class AuthErrorEmailAlreadyInUse extends Failure {}

class AuthErrorInvalidCredential extends Failure {}

//signIn errors

class AuthErrorInvalidEmailSignIn extends Failure {}

class AuthErrorWrongPassword extends Failure {}

class AuthErrorUserNotFound extends Failure {}

class AuthErrorUserDisabled extends Failure {}

class AuthErrorTooManyRequests extends Failure {}

class AuthErrorOperationNotFound extends Failure {}
