class InternetException implements Exception {}

class AuthServerException implements Exception {}

class AuthEmptyCacheDataException implements Exception {}

class AuthWrongDataException implements Exception {}

class AuthUserExistException implements Exception {}

class AuthUserNotExistException implements Exception {}

class ServerException implements Exception {
  final String code;
  ServerException(this.code);
}

//signup errors
class AuthErrorOperationNotAllowed implements Exception {}

class AuthErrorWeakPassword implements Exception {}

class AuthErrorInvalidEmailSignup implements Exception {}

class AuthErrorEmailAlreadyInUse implements Exception {}

class AuthErrorInvalidCredential implements Exception {}

//signIn errors

class AuthErrorInvalidEmailSignIn implements Exception {}

class AuthErrorWrongPassword implements Exception {}

class AuthErrorUserNotFound implements Exception {}

class AuthErrorUserDisabled implements Exception {}

class AuthErrorTooManyRequests implements Exception {}

class AuthErrorOperationNotFound implements Exception {}

class UserNotExistException implements Exception {}

class UnknownError implements Exception {}
