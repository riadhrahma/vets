import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  SignInWithEmailAndPasswordUseCase(this.authRepository);

  Future<Either<Failure, Unit>> signIntWithEmailAndPassword(
      String email, String password) async {
    return await authRepository.signIntWithEmailAndPassword(
      email,
      password,
    );
  }
}
