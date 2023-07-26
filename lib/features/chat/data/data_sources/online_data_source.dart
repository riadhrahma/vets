import 'dart:async';
import 'dart:convert';
import 'dart:io' hide ContentType;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'package:vets_project/core/errors/exceptions.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/models/channel_model.dart';
import 'package:vets_project/features/chat/data/models/emergency_request_model.dart';
import 'package:vets_project/features/chat/data/models/message_content_model.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';
import 'package:vets_project/features/chat/data/models/push_notification_model.dart';
import 'package:vets_project/features/chat/data/models/user_location_model.dart';
import 'package:vets_project/features/pets_management/data/models/pet_model.dart';

abstract class ChatOnlineDataSource {
  Future<Unit> createChannel(
    ChannelModel channelModel,
  );
  Future<ChannelModel> fetchChannel(String id);

  Future<List<ChannelModel>> getClientChannels(
    String userID,
  );
  Future<List<ChannelModel>> getVeterinaryChannels(
    String userID,
  );
  Future<bool> channelIsExist(
    String channelID,
  );
  Future<List<ChannelModel>> searchChannel(
    String userName,
  );
  Future<Unit> updateMyChannel(
    ChannelModel channelModel,
  );
  Future<Unit> deleteChannel(
    String channelID,
  );
  Future<Unit> deleteMessage(
    String messageID,
  );

  Future<MessageModel> fetchMessage(String id);
  Future<List<MessageModel>> searchMessage(
    String message,
    String channelID,
  );
  Future<Unit> sendPushNotification(
    PushNotificationModel pushNotificationModel,
  );
  Future<bool> messageIsExist(
    String messageID,
  );

  Future<FilePickerResult?> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  );
  Future<Unit> sendMessage(
    MessageModel messageModel,
  );

  Future<List<MessageModel>> getChannelMessages(
    String channelID,
  );

  Future<Unit> createEmergencyRequest(
      EmergencyRequestModel emergencyRequestModel);

  Future<List<PetModel>> getMyPets(String clientID);

  Future<UserLocationModel> fetchUserLocation();
//this methode will return the id of channel created
  Future<String> createNewEmergencyRequestProcess(
    String petId,
    String clientId,
  );

  Future<String> uploadFile(
    String filePath,
  );

  Future<Unit> sendFileMessageProcess(ImageSource imageSource,
      ContentType contentType, MessageModel messageModel);
}

class ChatOnlineDataSourceImpl implements ChatOnlineDataSource {
  final CollectionReference<Map<String, dynamic>> veterinaryCollection;
  final CollectionReference<Map<String, dynamic>> subMessageCollection;
  final CollectionReference<Map<String, dynamic>> clientCollection;

  final CollectionReference<Map<String, dynamic>> channelCollection;
  final CollectionReference<Map<String, dynamic>> messageCollection;
  final CollectionReference<Map<String, dynamic>> emergencyRequestCollection;

  final CollectionReference<Map<String, dynamic>> petCollection;
  // ignore: prefer_typing_uninitialized_variables
  final firestore;
  // ignore: prefer_typing_uninitialized_variables
  final auth;

  ChatOnlineDataSourceImpl(
    this.firestore,
    this.auth,
  )   : veterinaryCollection = firestore.collection('veterinary'),
        clientCollection = firestore.collection('client'),
        channelCollection = firestore.collection('channel'),
        messageCollection = firestore.collection('message'),
        emergencyRequestCollection = firestore.collection('emergency_request'),
        petCollection = firestore.collection('pets'),
        subMessageCollection = firestore.collection('sub_message');

  @override
  Future<Unit> createChannel(ChannelModel channelModel) async {
    try {
      await channelCollection.doc(channelModel.id).set(channelModel.toJson());
      return unit;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<Unit> deleteChannel(String channelID) async {
    try {
      final isExist = await channelIsExist(channelID);
      if (isExist) {
        await channelCollection.doc(channelID).delete();
        return unit;
      } else {
        throw ChannelNotExistException();
      }
    } on ChannelNotExistException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<Unit> deleteMessage(String messageID) async {
    print('deleteMessage: $messageID');
    try {
      final isExist = await messageIsExist(messageID);
      if (isExist) {
        await messageCollection.doc(messageID).delete();
        return unit;
      } else {
        throw MessageNotExistException();
      }
    } on MessageNotExistException {
      rethrow;
    } catch (e) {
      if (e is FirebaseException) {
        throw ServerException(e.code);
      }

      throw UnknownError();
    }
  }

  @override
  Future<List<MessageModel>> getChannelMessages(String channelID) async {
    try {
      final query =
          messageCollection.where(ChannelModel.idKey, isEqualTo: channelID);
      final result = await query.get();
      final List<MessageModel> messages = result.docs
          .map(
            (e) => MessageModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return messages;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<List<MessageModel>> searchMessage(String message, String channelID) {
    // TODO: implement searchMessage
    throw UnimplementedError();
  }

  @override
  Future<Unit> sendMessage(MessageModel messageModel) async {
    try {
      await messageCollection.doc(messageModel.id).set(messageModel.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
    return unit;
  }

  @override
  Future<Unit> createEmergencyRequest(
      EmergencyRequestModel emergencyRequestModel) async {
    try {
      await emergencyRequestCollection
          .doc(emergencyRequestModel.id)
          .set(emergencyRequestModel.toMap);
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
    return unit;
  }

  @override
  Future<Unit> updateMyChannel(ChannelModel channelModel) {
    // TODO: implement updateMyChannel
    throw UnimplementedError();
  }

  @override
  Future<Unit> sendPushNotification(
      PushNotificationModel pushNotificationModel) async {
    const String serverToken =
        'AAAAduHVY2E:APA91bFpzIbuB9mvwSbelqgrREjco8QdLkUW9kP9juNPplG73hc0ChB5_J2Lti8LwVl8yc2Ab385iTb47o6IUWeajKpCSVy19e-5vw-9hoylZRC35IMoqMG8SyF0XZ8SEJu3Oh7HWnxR';
    var result = await http.post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': pushNotificationModel.body,
            'title': pushNotificationModel.title,
            'image': pushNotificationModel.imageUrl
          },
          'priority': 'high',
          "android": <String, dynamic>{
            "notification": <String, dynamic>{"channel_id": 'Channel ID'}
          },
          'data': pushNotificationModel.toMap,
          'to': pushNotificationModel.targetFcmToken,
        },
      ),
    );
    if (result.statusCode != 200) {
      throw ServerException(result.body);
    }
    return unit;
  }

  @override
  Future<bool> channelIsExist(String channelID) async {
    final docResult = await channelCollection.doc(channelID).get();
    return docResult.exists;
  }

  @override
  Future<bool> messageIsExist(String messageID) async {
    final docResult = await messageCollection.doc(messageID).get();
    return docResult.exists;
  }

  @override
  Future<List<ChannelModel>> searchChannel(String userName) {
    throw Exception();
  }

  @override
  Future<List<ChannelModel>> getClientChannels(String userID) async {
    try {
      final query =
          channelCollection.where(ChannelModel.clientIDKey, isEqualTo: userID);
      final result = await query.get();
      final List<ChannelModel> channels =
          result.docs.map((e) => ChannelModel.fromJson(e.data())).toList();
      return channels;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<List<ChannelModel>> getVeterinaryChannels(String userID) async {
    try {
      final query = channelCollection.where(
        ChannelModel.vetsIDKey,
        isEqualTo: userID,
      );
      final result = await query.get();
      final List<ChannelModel> channels = result.docs
          .map(
            (e) => ChannelModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return channels;
    } on FirebaseException catch (e) {
      throw ServerException(
        e.code,
      );
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<FilePickerResult?> pickFiles(
    ImageSource imageSource,
    ContentType contentType,
  ) async {
    FilePickerResult? result;

    switch (contentType) {
      case ContentType.image:
        {
          result = await FilePicker.platform.pickFiles(type: FileType.image);

          return result;
        }
      case ContentType.video:
        {
          result = await FilePicker.platform.pickFiles(type: FileType.video);
          return result;
        }

      default:
        {
          result = await FilePicker.platform
              .pickFiles(type: FileType.custom, allowedExtensions: [
            'pdf',
            'doc',
            'txt',
          ]);
          print(result!.paths.toString());
          return result;
        }
    }
  }

  @override
  Future<ChannelModel> fetchChannel(String id) async {
    try {
      final dataResult = await channelCollection.doc(id).get();
      if (dataResult.exists) {
        return ChannelModel.fromJson(dataResult.data()!);
      }
      throw ChannelNotExistException();
    } on ChannelNotExistException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      debugPrint(e.runtimeType.toString());
      throw UnknownError();
    }
  }

  @override
  Future<MessageModel> fetchMessage(String id) async {
    try {
      final dataResult = await messageCollection.doc(id).get();
      if (dataResult.exists) {
        return MessageModel.fromJson(dataResult.data()!);
      }
      throw ChannelNotExistException();
    } on MessageNotExistException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      debugPrint(e.runtimeType.toString());
      throw UnknownError();
    }
  }

  @override
  Future<List<PetModel>> getMyPets(String clientID) async {
    try {
      final QuerySnapshot<Object?> querySnapshot =
          await petCollection.where('ownerID', isEqualTo: clientID).get();
      List<PetModel> petsList = querySnapshot.docs.map((e) {
        return PetModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      return petsList;
    } on ServerException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<UserLocationModel> fetchUserLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();

      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw LocationPermissionDeniedException();
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw LocationGpsDisabledException();
        }
      }

      final result = await location.getLocation();
      assert(result.latitude != null && result.longitude != null);
      return UserLocationModel(
        result.latitude!,
        result.longitude!,
      );
    } on LocationPermissionDeniedException {
      rethrow;
    } on LocationGpsDisabledException {
      rethrow;
    } on AssertionError {
      throw LocationGpsNullValuesException();
    } on LocationGpsNullValuesException {
      rethrow;
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<String> createNewEmergencyRequestProcess(
      String petId, clientId) async {
    try {
      final emergencyRequestId = const Uuid().v4();
      final channelId = const Uuid().v4();
      final UserLocationModel clientLocation = await fetchUserLocation();
      EmergencyRequestModel emergencyRequestModel = EmergencyRequestModel(
        id: emergencyRequestId,
        petId: petId,
        clientLocation: clientLocation,
        veterinaryLocation: const UserLocationModel(0, 0),
        veterinaryId: '',
      );
      await createEmergencyRequest(emergencyRequestModel);
      final ChannelModel channelModel = ChannelModel(
        id: channelId,
        animalId: petId,
        clientID: clientId,
        emergencyRequestID: emergencyRequestId,
        isEmergency: debugInstrumentationEnabled,
        vetsID: const [],
        createdAt: DateTime.now(),
      );
      await createChannel(channelModel);
      return channelId;
    } catch (e) {
      throw UnknownError();
    }
  }

  @override
  Future<String> uploadFile(
    String filePath,
  ) async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();
    final String fileFormat = filePath.split('.').last;

    final String imageName = const Uuid().v1();

    final mountainsRef =
        storageRef.child("$fileFormat/messages/$imageName.$fileFormat");

    File file = File(filePath);

    try {
      await mountainsRef.putFile(file);

      String getDownloadURL = await mountainsRef.getDownloadURL();

      return getDownloadURL;
    } on FirebaseException catch (e) {
      throw ServerException(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
      throw UnknownError();
    }
  }

  @override
  Future<Unit> sendFileMessageProcess(ImageSource imageSource,
      ContentType contentType, MessageModel messageModel) async {
    try {
      final result = await pickFiles(
        imageSource,
        contentType,
      );
      if (result == null) {
        throw UnknownError();
      }

      final url = await uploadFile(
        result.paths.first!,
      );
      messageModel.setMessageContent =
          MessageContentModel(contentType: contentType, value: url);
      await sendMessage(messageModel);

      return unit;
    } catch (e) {
      throw UnknownError();
    }
  }
}
