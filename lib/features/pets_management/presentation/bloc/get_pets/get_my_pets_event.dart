import 'package:equatable/equatable.dart';

abstract class GetMyPetsEvent extends Equatable {
  const GetMyPetsEvent();

  @override
  List<Object> get props => [];
}

class GetAllMyPetsEvent extends GetMyPetsEvent {}

class RefreshPetsEvent extends GetMyPetsEvent {}
