import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class FetchClientInfoUseCase {
  final AuthRepository authRepository;

  FetchClientInfoUseCase(this.authRepository);

  Future<Either<Failure, ClientEntity>> fetchClientInfo(String id) async {
    return await authRepository.fetchClientInfo(id);
  }
}
