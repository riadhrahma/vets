import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class ClientSignupProcessUseCase {
  final AuthRepository authRepository;

  ClientSignupProcessUseCase(this.authRepository);

  Future<Either<Failure, Unit>> clientSignupProcess(
      ClientEntity clientEntity, String password) async {
    return await authRepository.clientSignupProcess(
      clientEntity,
      password,
    );
  }
}
