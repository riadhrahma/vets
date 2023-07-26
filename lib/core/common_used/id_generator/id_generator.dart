import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  String get id;
}

class UUIDGeneratorImpl implements IdGenerator {
  final Uuid _uuid;
  UUIDGeneratorImpl(this._uuid);
  @override
  String get id => _uuid.v4();
}
