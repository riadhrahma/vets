import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class SaveCachedClientInfoUseCase {
  final AuthRepository authRepository;

  SaveCachedClientInfoUseCase(this.authRepository);

  Future<Either<Failure, Unit>> saveClientInfo(
    ClientEntity clientEntity,
  ) async {
    return await authRepository.saveClientInfo(
      clientEntity,
    );
  }
}
