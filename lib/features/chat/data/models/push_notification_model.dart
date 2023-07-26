import 'package:vets_project/features/chat/domain/entities/push_notification_entity.dart';

class PushNotificationModel extends PushNotificationEntity {
  static const String _title = 'title';
  static const String _body = 'body';
  static const String _imageUrl = 'imageUrl';
  static const String _targetFcmToken = 'targetFcmToken';
  const PushNotificationModel(
    super.title,
    super.body,
    super.imageUrl,
    super.targetFcmToken,
  );

  Map<String, String> get toMap => {
        _title: _title,
        _body: body,
        _imageUrl: imageUrl,
        _targetFcmToken: targetFcmToken,
      };

  factory PushNotificationModel.fromJson(json) {
    return PushNotificationModel(
      json[_title],
      json[_body],
      json[_imageUrl],
      json[_targetFcmToken],
    );
  }
}
