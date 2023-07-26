import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/models/message_content_model.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';
import 'package:vets_project/features/chat/domain/use_cases/delete_message_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/get_channel_messages_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/pick_file_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/send_file_message_process_use_case.dart';
import 'package:vets_project/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:vets_project/features/chat/domain/use_cases/upload_flle_use_case.dart';

part 'emergency_chat_event.dart';
part 'emergency_chat_state.dart';

class EmergencyChatBloc extends Bloc<EmergencyChatEvent, EmergencyChatState> {
  final GetChannelMessagesUseCase getChannelMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final UploadFileUseCase uploadFileUseCase;
  final PickFilesUseCase pickFilesUseCase;
  final SendFileMessageProcessUseCase sendFileMessageUseCase;
  final DeleteMessageUseCase deleteMessageUseCase;
  EmergencyChatBloc({
    required this.sendFileMessageUseCase,
    required this.getChannelMessagesUseCase,
    required this.sendMessageUseCase,
    required this.uploadFileUseCase,
    required this.pickFilesUseCase,
    required this.deleteMessageUseCase,
  }) : super(EmergencyChatInitial()) {
    on<EmergencyChatEvent>((event, emit) async {
      if (event is GetChannelMessages) {
        final messages =
            await getChannelMessagesUseCase.getChannelMessages(event.channelId);
        messages.fold((l) {
          emit(GetChannelMessagesFailed());
        }, (r) {
          emit(GetChannelMessagesSuccess(r));
        });
      }
      if (event is SendVocalMessageEvent) {
        String vocalUrl = '';
        final uploadResult =
            await uploadFileUseCase.uploadFile(event.vocalPath);
        uploadResult.fold((l) {}, (r) {
          vocalUrl = r;
        });
        MessageEntity messageEntity = MessageEntity(
          id: const Uuid().v4(),
          senderID: FirebaseAuth.instance.currentUser!.uid,
          recipientID: '',
          messageContentModel: MessageContentModel(
              contentType: ContentType.audio, value: vocalUrl),
          channelID: event.channelId,
          senderRole: '',
          sendAt: DateTime.now(),
        );
        final sendMessage = await sendMessageUseCase.sendMessage(messageEntity);
        sendMessage.fold((l) {
          emit(SendVocalMessageFailed());
        }, (r) {
          emit(SendVocalMessageSuccess());
        });
      }

      if (event is SendTexMessageEvent) {
        MessageEntity messageEntity = MessageEntity(
          id: const Uuid().v4(),
          senderID: FirebaseAuth.instance.currentUser!.uid,
          recipientID: '',
          messageContentModel: MessageContentModel(
              contentType: ContentType.text, value: event.message),
          channelID: event.channelId,
          senderRole: '',
          sendAt: DateTime.now(),
        );
        final sendMessage = await sendMessageUseCase.sendMessage(messageEntity);
        sendMessage.fold((l) {
          emit(SendTextMessageFailed());
        }, (r) {
          emit(SendTextMessageSuccess());
        });
      }

      if (event is SendDocumentMessageEvent) {
        print('showwww');
        MessageModel messageEntity = MessageModel(
          id: const Uuid().v4(),
          senderID: FirebaseAuth.instance.currentUser!.uid,
          recipientID: '',
          messageContentModel: const MessageContentModel(
              contentType: ContentType.text, value: ''),
          channelID: event.channelId,
          senderRole: '',
          sendAt: DateTime.now(),
        );
        final sendMessage = await sendFileMessageUseCase.sendFileMessageProcess(
          ImageSource.gallery,
          ContentType.document,
          messageEntity,
        );
        sendMessage.fold((l) {
          print(l);
          emit(SendDocumentMessageFailed());
        }, (r) {
          emit(SendDocumentMessageSuccess());
        });
      }

      if (event is SendImageMessageEvent) {
        MessageModel messageEntity = MessageModel(
          id: const Uuid().v4(),
          senderID: FirebaseAuth.instance.currentUser!.uid,
          recipientID: '',
          messageContentModel: const MessageContentModel(
              contentType: ContentType.text, value: ''),
          channelID: event.channelId,
          senderRole: '',
          sendAt: DateTime.now(),
        );
        final sendMessage = await sendFileMessageUseCase.sendFileMessageProcess(
          ImageSource.gallery,
          ContentType.image,
          messageEntity,
        );
        sendMessage.fold((l) {
          emit(SendImageMessageFailed());
        }, (r) {
          emit(SendImageMessageSuccess());
        });
      }

      if (event is SendVideoMessageEvent) {
        MessageModel messageEntity = MessageModel(
          id: const Uuid().v4(),
          senderID: FirebaseAuth.instance.currentUser!.uid,
          recipientID: '',
          messageContentModel: const MessageContentModel(
            contentType: ContentType.text,
            value: '',
          ),
          channelID: event.channelId,
          senderRole: '',
          sendAt: DateTime.now(),
        );
        final sendMessage = await sendFileMessageUseCase.sendFileMessageProcess(
          ImageSource.gallery,
          ContentType.video,
          messageEntity,
        );
        sendMessage.fold((l) {
          emit(SendVideoMessageFailed());
        }, (r) {
          emit(SendVideoMessageSuccess());
        });
      }

      if (event is DeleteMessageEvent) {
        final result =
            await deleteMessageUseCase.deleteMessage(event.messageId);
        result.fold((l) {
          emit(DeleteMessageFailed());
        }, (r) {
          emit(DeleteMessageSuccess());
        });
      }
    });
  }
}
