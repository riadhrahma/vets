part of 'get_my_pets_bloc.dart';

abstract class GetMyPetsState extends Equatable {
  const GetMyPetsState();

  @override
  List<Object> get props => [];
}

class GetMyPetsInitial extends GetMyPetsState {}

class LoadingPetsState extends GetMyPetsState {}

class LoadedPetsState extends GetMyPetsState {
  final List<PetEntity> pets;

  const LoadedPetsState({required this.pets});

  @override
  List<Object> get props => [pets];
}

class ErrorPetsState extends GetMyPetsState {
  final String message;

  const ErrorPetsState({required this.message});

  @override
  List<Object> get props => [message];
}
