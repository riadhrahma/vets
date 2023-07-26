import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class RemoveCachedClientInfoUseCase {
  final AuthRepository authRepository;

  RemoveCachedClientInfoUseCase(this.authRepository);

  Future<Either<Failure, Unit>> removeCachedClientInfoUseCase(
    ClientEntity clientEntity,
  ) async {
    return await authRepository.removeClientInfo();
  }
}
