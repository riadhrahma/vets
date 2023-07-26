import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class VeterinarySignupProcessUseCase {
  final AuthRepository authRepository;

  VeterinarySignupProcessUseCase(this.authRepository);

  Future<Either<Failure, Unit>> veterinarySignupProcess(
      VeterinaryEntity veterinaryEntity, String password) async {
    return await authRepository.veterinarySignupProcess(
      veterinaryEntity,
      password,
    );
  }
}
