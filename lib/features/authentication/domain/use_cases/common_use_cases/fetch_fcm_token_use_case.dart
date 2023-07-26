import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class FetchFcmTokenUseCase {
  final AuthRepository authRepository;

  FetchFcmTokenUseCase(this.authRepository);

  Future<Either<Failure, Unit>> fetchFcmToken(
      String email, String password) async {
    return await authRepository.fetchFcmToken();
  }
}
