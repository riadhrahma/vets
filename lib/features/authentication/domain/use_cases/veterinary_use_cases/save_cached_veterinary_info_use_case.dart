import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/veterinary_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class SaveCachedVeterinaryInfoUseCase {
  final AuthRepository authRepository;

  SaveCachedVeterinaryInfoUseCase(this.authRepository);

  Future<Either<Failure, Unit>> saveCachedVeterinaryInfo(
    VeterinaryEntity veterinaryEntity,
  ) async {
    return await authRepository.saveVeterinaryInfo(
      veterinaryEntity,
    );
  }
}
