import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'sound_message_state.dart';

class SoundMessageCubit extends Cubit<SoundMessageState> {
  final playerController = AudioPlayer();

  Duration soundDuration = const Duration(milliseconds: 1);

  SoundMessageCubit() : super(SoundMessageInitial());

  Future<void> fetchSoundDuration(String soundUrl) async {
    soundDuration = (await playerController.setUrl(soundUrl))!;
    emit(SoundMessageInitial());
  }

  Future<void> playSound(String soundUrl) async {
    print('playSound clicked');

    await playerController.setUrl(soundUrl);

    await playerController.play();
    emit(StartPay());
  }

  Future<void> pauseSound() async {
    await playerController.stop();
    // playerController.stopAllPlayers();

    emit(StopPlay());
  }
}
