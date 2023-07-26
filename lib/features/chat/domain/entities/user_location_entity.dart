import 'package:equatable/equatable.dart';

class UserLocationEntity extends Equatable {
  final double lat;
  final double lng;

  const UserLocationEntity(this.lat, this.lng);

  @override
  List<Object?> get props => [lat, lng];
}
