part of 'add_pets_bloc.dart';

abstract class AddPetsState {}

class AddPetsInitial extends AddPetsState {}

class AddPetsSuccessState extends AddPetsState {}

class UnknownErrorSate extends AddPetsState {}
