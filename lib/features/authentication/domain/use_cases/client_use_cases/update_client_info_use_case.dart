import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class UpdateClientInfoUseCase {
  final AuthRepository authRepository;

  UpdateClientInfoUseCase(this.authRepository);

  Future<Either<Failure, Unit>> updateClientInfo(
      ClientEntity clientEntity) async {
    return await authRepository.updateClientInfo(clientEntity);
  }
}
