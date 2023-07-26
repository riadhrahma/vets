import 'package:dartz/dartz.dart';
import 'package:vets_project/core/errors/failures.dart';

import '../repositories/chat_repository.dart';

class UploadFileUseCase {
  final ChatRepository chatRepository;

  UploadFileUseCase(this.chatRepository);

  Future<Either<Failure, String>> uploadFile(filePath) async {
    return await chatRepository.uploadFile(filePath);
  }
}
