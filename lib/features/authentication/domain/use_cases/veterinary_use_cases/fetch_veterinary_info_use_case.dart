import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class FetchVeterinaryInfoUseCase {
  final AuthRepository authRepository;

  FetchVeterinaryInfoUseCase(this.authRepository);

  Future<Either<Failure, Unit>> fetchVeterinaryInfo(String id) async {
    return await authRepository.fetchVeterinaryInfo(id);
  }
}
