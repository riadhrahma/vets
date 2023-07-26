import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/data/models/veterinary_model.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/authentication/domain/repositories/auth_repository.dart';

class GetCachedVeterinaryInfoUseCase {
  final AuthRepository authRepository;

  GetCachedVeterinaryInfoUseCase(this.authRepository);

  Future<Either<Failure, VeterinaryModel>> getCachedVeterinaryInfo(
    ClientEntity clientEntity,
  ) async {
    return await authRepository.getCachedVeterinaryInfo();
  }
}
