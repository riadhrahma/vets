import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';
import 'package:vets_project/features/chat/data/models/user_location_model.dart';
import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';
import 'package:vets_project/features/chat/domain/entities/emergency_request_entity.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';
import 'package:vets_project/features/chat/domain/entities/push_notification_entity.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

abstract class ChatRepository {
  Future<Either<Failure, Unit>> createChannel(
    ChannelEntity channelEntity,
  );
  Future<Either<Failure, ChannelEntity>> fetchChannel(
    String id,
  );

  Future<Either<Failure, List<ChannelEntity>>> getClientChannels(
    String userID,
  );
  Future<Either<Failure, List<ChannelEntity>>> getVeterinaryChannels(
    String userID,
  );
  Future<Either<Failure, bool>> channelIsExist(
    String channelID,
  );
  Future<Either<Failure, List<ChannelEntity>>> searchChannel(
    String userName,
  );
  Future<Either<Failure, Unit>> updateMyChannel(
    ChannelEntity channelEntity,
  );
  Future<Either<Failure, Unit>> deleteChannel(
    String channelID,
  );
  Future<Either<Failure, Unit>> deleteMessage(
    String messageID,
  );

  Future<Either<Failure, MessageEntity>> fetchMessage(
    String id,
  );
  Future<Either<Failure, MessageEntity>> searchMessage(
    String message,
    String channelID,
  );
  Future<Either<Failure, Unit>> sendPushNotification(
    PushNotificationEntity pushNotificationEntity,
  );
  Future<Either<Failure, bool>> messageIsExist(
    String messageID,
  );

  Future<Either<Failure, FilePickerResult?>> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  );
  Future<Either<Failure, Unit>> sendMessage(
    MessageEntity messageEntity,
  );

  Future<Either<Failure, List<MessageEntity>>> getChannelMessages(
    String channelID,
  );
  Future<Either<Failure, Unit>> createEmergencyRequest(
      EmergencyRequestEntity emergencyRequestEntity);

  Future<Either<Failure, List<PetModel>>> getMyPets(String clientId);

  Future<Either<Failure, UserLocationModel>> fetchUserLocation();

  Future<Either<Failure, String>> createNewEmergencyRequestProcess(
    String petId,
    String clientId,
  );

  Future<Either<Failure, String>> uploadFile(
    String filePath,
  );
  Future<Either<Failure, Unit>> sendFileMessageProcess(ImageSource imageSource,
      ContentType contentType, MessageModel messageModel);
}
