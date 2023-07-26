import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/errors/failures.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/data_sources/online_data_source.dart';
import 'package:vets_project/features/chat/data/models/channel_model.dart';
import 'package:vets_project/features/chat/data/models/emergency_request_model.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';
import 'package:vets_project/features/chat/data/models/push_notification_model.dart';
import 'package:vets_project/features/chat/data/models/user_location_model.dart';
import 'package:vets_project/features/chat/domain/entities/channel_entity.dart';
import 'package:vets_project/features/chat/domain/entities/emergency_request_entity.dart';
import 'package:vets_project/features/chat/domain/entities/message_entity.dart';
import 'package:vets_project/features/chat/domain/entities/push_notification_entity.dart';
import 'package:vets_project/features/chat/domain/repositories/chat_repository.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatOnlineDataSourceImpl chatOnlineDataSourceImpl;

  ChatRepositoryImpl({required this.chatOnlineDataSourceImpl});
  @override
  Future<Either<Failure, bool>> channelIsExist(String channelID) async {
    try {
      final bool result =
          await chatOnlineDataSourceImpl.channelIsExist(channelID);
      return right(
        result,
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> createChannel(
      ChannelEntity channelEntity) async {
    try {
      final ChannelModel channelModel = ChannelModel(
        id: channelEntity.id,
        animalId: channelEntity.animalId,
        clientID: channelEntity.clientID,
        emergencyRequestID: channelEntity.emergencyRequestID,
        isEmergency: channelEntity.isEmergency,
        vetsID: channelEntity.vetsID,
        createdAt: channelEntity.createdAt,
      );
      await chatOnlineDataSourceImpl.createChannel(channelModel);
      return right(unit);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteChannel(String channelID) async {
    try {
      await chatOnlineDataSourceImpl.deleteChannel(channelID);
      return right(unit);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMessage(String messageID) async {
    try {
      await chatOnlineDataSourceImpl.deleteMessage(messageID);
      return right(unit);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, ChannelEntity>> fetchChannel(String id) async {
    try {
      final ChannelModel result =
          await chatOnlineDataSourceImpl.fetchChannel(id);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> fetchMessage(String id) async {
    try {
      final MessageModel result =
          await chatOnlineDataSourceImpl.fetchMessage(id);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getChannelMessages(
      String channelID) async {
    try {
      final List<MessageEntity> result =
          await chatOnlineDataSourceImpl.getChannelMessages(channelID);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<ChannelEntity>>> getClientChannels(
      String userID) async {
    try {
      final List<ChannelEntity> result =
          await chatOnlineDataSourceImpl.getClientChannels(userID);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<ChannelEntity>>> getVeterinaryChannels(
      String userID) async {
    try {
      final List<ChannelEntity> result =
          await chatOnlineDataSourceImpl.getVeterinaryChannels(userID);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> messageIsExist(String messageID) async {
    try {
      final bool result =
          await chatOnlineDataSourceImpl.messageIsExist(messageID);
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, FilePickerResult?>> pickFiles(
      ImageSource imageSource, ContentType contentType) async {
    try {
      final FilePickerResult? result = await chatOnlineDataSourceImpl.pickFiles(
        imageSource,
        contentType,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(
        ServerFailure(
          e.code,
        ),
      );
    } catch (e) {
      return left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<ChannelEntity>>> searchChannel(String userName) {
    // TODO: implement searchChannel
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MessageEntity>> searchMessage(
      String message, String channelID) {
    // TODO: implement searchMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(MessageEntity messageEntity) async {
    try {
      MessageModel messageModel = MessageModel(
          id: messageEntity.id,
          senderID: messageEntity.senderID,
          sendAt: messageEntity.sendAt,
          senderRole: messageEntity.senderRole,
          recipientID: messageEntity.recipientID,
          messageContentModel: messageEntity.messageContentModel,
          channelID: messageEntity.channelID);
      await chatOnlineDataSourceImpl.sendMessage(messageModel);
      //todo add push notification after send message is success
      //sendPushNotification();
      return right(unit);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPushNotification(
      PushNotificationEntity pushNotificationEntity) async {
    try {
      final PushNotificationModel pushNotificationModel = PushNotificationModel(
          pushNotificationEntity.title,
          pushNotificationEntity.body,
          pushNotificationEntity.imageUrl,
          pushNotificationEntity.targetFcmToken);

      await chatOnlineDataSourceImpl
          .sendPushNotification(pushNotificationModel);
      return const Right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMyChannel(ChannelEntity channelEntity) {
    // TODO: implement updateMyChannel
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> createEmergencyRequest(
      EmergencyRequestEntity emergencyRequestEntity) async {
    try {
      final EmergencyRequestModel emergencyRequestModel = EmergencyRequestModel(
        id: emergencyRequestEntity.id,
        petId: emergencyRequestEntity.petId,
        clientLocation: emergencyRequestEntity.clientLocation,
        veterinaryLocation: emergencyRequestEntity.veterinaryLocation,
        veterinaryId: emergencyRequestEntity.veterinaryId,
      );
      await chatOnlineDataSourceImpl
          .createEmergencyRequest(emergencyRequestModel);
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<PetModel>>> getMyPets(String clientId) async {
    try {
      final result = await chatOnlineDataSourceImpl.getMyPets(clientId);
      return right(result);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure(e.code));
      }
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserLocationModel>> fetchUserLocation() async {
    try {
      final result = await chatOnlineDataSourceImpl.fetchUserLocation();
      return right(result);
    } on LocationGpsNullValuesException {
      return left(LocationGpsNullValuesFailure());
    } on LocationGpsDisabledException {
      return left(LocationGpsDisabledFailure());
    } on LocationPermissionDeniedException {
      return left(LocationPermissionDeniedFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createNewEmergencyRequestProcess(
      String petId, String clientId) async {
    try {
      final String result =
          await chatOnlineDataSourceImpl.createNewEmergencyRequestProcess(
        petId,
        clientId,
      );
      return right(result);
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(String filePath) async {
    try {
      final String url = await chatOnlineDataSourceImpl.uploadFile(filePath);
      return right(url);
    } catch (e) {
      print(e);
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendFileMessageProcess(
    ImageSource imageSource,
    ContentType contentType,
    MessageModel messageModel,
  ) async {
    try {
      await chatOnlineDataSourceImpl.sendFileMessageProcess(
        imageSource,
        contentType,
        messageModel,
      );
      return right(unit);
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
