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
class AuthErrorOperationNotAllowedFailure extends Failure {}

class AuthErrorWeakPasswordFailure extends Failure {}

class AuthErrorInvalidEmailSignupFailure extends Failure {}

class AuthErrorEmailAlreadyInUseFailure extends Failure {}

class AuthErrorInvalidCredentialFailure extends Failure {}

//signIn errors

class AuthErrorInvalidEmailSignInFailure extends Failure {}

class AuthErrorWrongPasswordFailure extends Failure {}

class AuthErrorUserNotFoundFailure extends Failure {}

class AuthErrorUserDisabledFailure extends Failure {}

class AuthErrorTooManyRequestsFailure extends Failure {}

class AuthErrorOperationNotFoundFailure extends Failure {}

class VeterinaryNotExistFailure extends Failure {}

class ClientNotExistFailure extends Failure {}

class ServerFailure extends Failure {
  final String code;
  ServerFailure(this.code);
}

class UnknownFailure extends Failure {
  final String? code;
  UnknownFailure({this.code});
}

class EmptyCacheFailure extends Failure {}

class DocumentNotExistFailure extends Failure {}

//fcm exceptions
class NullFcmTokenFailure extends Failure {}

class LocationPermissionDeniedFailure extends Failure {}

class LocationGpsDisabledFailure extends Failure {}

class LocationGpsNullValuesFailure extends Failure {}
