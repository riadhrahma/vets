import 'package:vets_project/features/chat/domain/entities/user_location_entity.dart';

class UserLocationModel extends UserLocationEntity {
  static const String _lat = 'lat';
  static const String _lng = 'lng';
  const UserLocationModel(
    super.lat,
    super.lng,
  );

  Map<String, double> get toMap => {_lat: lat, _lng: lng};

  factory UserLocationModel.fromMap(map) => UserLocationModel(
        map[_lat],
        map[_lng],
      );
}
