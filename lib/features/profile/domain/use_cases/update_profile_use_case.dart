import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository profileRepository;
  UpdateProfileUseCase({required this.profileRepository});

  Future<Either<Failure, Unit>> updateProfile(clientEntity) async {
    return await profileRepository.updateProfile(clientEntity);
  }
}
