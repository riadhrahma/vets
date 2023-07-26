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

class VeterinaryNotExistException implements Exception {}

class ClientNotExistException implements Exception {}

class UnknownError implements Exception {}

class DocumentNotExistException implements Exception {}

class EmptyCachException implements Exception {}

//fcm exceptions
class NullFcmTokenException implements Exception {}



// chat Exception

class ChannelNotExistException implements Exception {}

class MessageNotExistException implements Exception {}











//fetch location exceptions

class LocationPermissionDeniedException implements Exception {}

class LocationGpsDisabledException implements Exception {}

class LocationGpsNullValuesException implements Exception {}

