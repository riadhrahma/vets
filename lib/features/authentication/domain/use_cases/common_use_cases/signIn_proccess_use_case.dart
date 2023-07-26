import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class SignInProcessUseCase {
  final AuthRepository authRepository;

  SignInProcessUseCase(this.authRepository);

  Future<Either<Failure, Object>> signInProcess(
      String email, String password) async {
    return await authRepository.signInProcess(
      email,
      password,
    );
  }
}
