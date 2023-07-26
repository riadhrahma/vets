part of 'get_my_pets_bloc.dart';

abstract class GetMyPetsEvent extends Equatable {
  const GetMyPetsEvent();

  @override
  List<Object> get props => [];
}

class GetAllMyPetsEvent extends GetMyPetsEvent {}

class RefreshPetsEvent extends GetMyPetsEvent {}
