import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class CreateClientInDataBaseUseCase {
  final AuthRepository authRepository;

  CreateClientInDataBaseUseCase(this.authRepository);

  Future<Either<Failure, Unit>> createClientInDataBase(
      ClientEntity clientEntity) async {
    return await authRepository.createClientInDataBase(clientEntity);
  }
}
