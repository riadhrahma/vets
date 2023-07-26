import 'package:vets_project/core/global_use/global_use.dart';
import 'package:vets_project/features/chat/domain/entities/messege_content_entity.dart';

class MessageContentModel extends MessageContentEntity {
  static const String _contentType = 'contentType';
  static const String _value = 'value';
  const MessageContentModel({
    required super.contentType,
    required super.value,
  });

  Map<String, dynamic> get toMap => {
        _contentType: contentType.name,
        _value: value,
      };

  static ContentType stringToContentType(String value) =>
      ContentType.values.firstWhere(
        (element) => value == element.name,
        orElse: () => ContentType.text,
      );

  factory MessageContentModel.formJson(json) {
    return MessageContentModel(
      contentType: stringToContentType(json[_contentType]),
      value: json[_value],
    );
  }
}
