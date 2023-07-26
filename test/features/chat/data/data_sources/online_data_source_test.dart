import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:vets_project/core/common_used/firebase_collection/firebase_collection.dart';
import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/data/data_sources/online_data_source.dart';
import 'package:vets_project/features/chat/data/models/channel_model.dart';
import 'package:vets_project/features/chat/data/models/message_content_model.dart';
import 'package:vets_project/features/chat/data/models/message_model.dart';

import '../../../../core/firebase_collection/extensions/collection_extension.dart';

main() async {
  ChatOnlineDataSourceImpl chatOnlineDataSourceImpl =
      ChatOnlineDataSourceImpl();
  chatOnlineDataSourceImpl.setChannelCollection =
      FirebaseCollection.channelCollectionName.collectionTest;
  chatOnlineDataSourceImpl.setMessageCollection =
      FirebaseCollection.messageCollectionName.collectionTest;

  final String id = const Uuid().v4();

  group('chatOnlineDataSourceImpl channel', () {
    test(
      'add channel test',
      () async {
        final ChannelModel channelModel = ChannelModel(
          id: id,
          animalId: 'animalId',
          clientID: 'clientID',
          emergencyRequestID: 'emergencyRequestID',
          isEmergency: true,
          vetsID: const ['vetsID'],
          createdAt: DateTime.now(),
        );
        await chatOnlineDataSourceImpl.createChannel(channelModel);
        final bool isExist = await chatOnlineDataSourceImpl.channelIsExist(
          id,
        );
        expect(isExist, true);
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1,
        ),
      ),
    );

    test(
      'fetch channel data test',
      () async {
        final ChannelModel channelModel = ChannelModel(
          id: id,
          animalId: 'animalId',
          clientID: 'clientID',
          emergencyRequestID: 'emergencyRequestID',
          isEmergency: true,
          vetsID: const ['vetsID'],
          createdAt: DateTime.now(),
        );
        await chatOnlineDataSourceImpl.createChannel(channelModel);
        final bool isExist = await chatOnlineDataSourceImpl.channelIsExist(
          id,
        );
        expect(isExist, true);
        final ChannelModel channelModelFromDb =
            await chatOnlineDataSourceImpl.fetchChannel(id);

        expect(channelModel, channelModelFromDb);
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1,
        ),
      ),
    );
  });

  group('chatOnlineDataSourceImpl message', () {
    test(
      'fetch message data test',
      () async {
        const messageContentModel =
            MessageContentModel(contentType: ContentType.text, value: 'hello!');
        final MessageModel messageModel = MessageModel(
            id: id,
            senderID: 'senderID',
            sendAt: DateTime.now(),
            senderRole: 'senderRole',
            recipientID: 'recipientID',
            messageContentModel: messageContentModel,
            channelID: 'channelID');

        await chatOnlineDataSourceImpl.sendMessage(messageModel);

        final bool isExist = await chatOnlineDataSourceImpl.messageIsExist(
          id,
        );
        expect(isExist, true);
        final MessageModel messageModelFromDb =
            await chatOnlineDataSourceImpl.fetchMessage(id);

        expect(messageModel, messageModelFromDb);
      },
      timeout: const Timeout(
        Duration(
          milliseconds: 1,
        ),
      ),
    );
  });
}
