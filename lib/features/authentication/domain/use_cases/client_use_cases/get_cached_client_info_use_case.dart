import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/data/models/client_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class GetCachedClientInfoUseCase {
  final AuthRepository authRepository;

  GetCachedClientInfoUseCase(this.authRepository);

  Future<Either<Failure, ClientModel>> getCachedClientInfo(
    ClientEntity clientEntity,
  ) async {
    return await authRepository.getCachedClientInfo();
  }
}
