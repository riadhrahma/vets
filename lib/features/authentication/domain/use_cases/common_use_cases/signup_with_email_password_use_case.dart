import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class SignupWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  SignupWithEmailAndPasswordUseCase(this.authRepository);

  Future<Either<Failure, Unit>> signupWithEmailAndPassword(
      String email, String password) async {
    return await authRepository.signupWithEmailAndPassword(email, password);
  }
}
