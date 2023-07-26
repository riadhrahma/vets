
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vets_project/core/errors/failures.dart' ;
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class PickFilesUseCase {
  final ChatRepository chatRepository;

  PickFilesUseCase(this.chatRepository);

  Future<Either<Failure, FilePickerResult?>> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  ) async {
    return await chatRepository.pickFiles(imageSource, contentType);
  }
}
