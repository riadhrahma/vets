import 'package:equatable/equatable.dart';
import 'package:vets_project/core/global_use/global_use.dart';

class MessageContentEntity extends Equatable {
  final ContentType contentType;
  final String value;

  const MessageContentEntity({
    required this.contentType,
    required this.value,
  });
  @override
  List<Object?> get props => [
    contentType,
        value,
      ];
}
