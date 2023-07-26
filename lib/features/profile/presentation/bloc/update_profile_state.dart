part of 'update_profile_bloc.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileProcessSuccessState extends UpdateProfileState {}

class UpdateProfileProcessFailedState extends UpdateProfileState {}
