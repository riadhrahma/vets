import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';

class SendFileMessageProcessUseCase {
  final ChatRepository chatRepository;

  SendFileMessageProcessUseCase(this.chatRepository);

  Future<Either<Failure, Unit>> sendFileMessageProcess(ImageSource imageSource,
      ContentType contentType, MessageModel messageModel) async {
    return await chatRepository.sendFileMessageProcess(
        imageSource, contentType, messageModel);
  }
}
