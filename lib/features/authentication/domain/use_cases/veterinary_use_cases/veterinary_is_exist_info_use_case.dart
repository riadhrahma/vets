import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class VeterinaryIsExistUseCase {
  final AuthRepository authRepository;

  VeterinaryIsExistUseCase(this.authRepository);

  Future<Either<Failure, Unit>> veterinaryIsExist(String id) async {
    return await authRepository.veterinaryIsExist(id);
  }
}
