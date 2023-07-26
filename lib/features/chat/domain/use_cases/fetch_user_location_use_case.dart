import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/features/chat/data/models/user_location_model.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class FetchUserLocationUseCase {
  final ChatRepository chatRepository;

  FetchUserLocationUseCase(this.chatRepository);

  Future<Either<Failure, UserLocationModel>> fetchUserLocation() async {
    return await chatRepository.fetchUserLocation();
  }
}
