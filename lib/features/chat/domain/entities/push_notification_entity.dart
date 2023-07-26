import 'package:equatable/equatable.dart';

class PushNotificationEntity extends Equatable {
  final String title;
  final String body;
  final String imageUrl;
  final String targetFcmToken;

  const PushNotificationEntity(
      this.title, this.body, this.imageUrl, this.targetFcmToken);

  @override
  List<Object?> get props => [title, body, imageUrl, targetFcmToken];
}
