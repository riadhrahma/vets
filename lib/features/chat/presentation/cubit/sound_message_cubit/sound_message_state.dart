part of 'sound_message_cubit.dart';

@immutable
abstract class SoundMessageState {}

class SoundMessageInitial extends SoundMessageState {}

class StartPay extends SoundMessageState {}

class StopPlay extends SoundMessageState {}
