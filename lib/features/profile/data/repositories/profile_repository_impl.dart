import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';
import 'package:vets_project/features/profile/data/data_sources/remote_data_source.dart';
import 'package:vets_project/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileOnlineDataSource profileOnlineDataSource;

  ProfileRepositoryImpl({
    required this.profileOnlineDataSource,
  });

  @override
  Future<Either<Failure, Unit>> updateProfile(ClientEntity clientEntity) async {
    await profileOnlineDataSource.updateProfile(clientEntity);
    return right(unit);
  }
}
