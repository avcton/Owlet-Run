import 'package:audioplayers/audioplayers.dart';

class AudioSfx {
  static final click = AudioPlayer()
    ..setSource(AssetSource('audio/click.wav')); // Click
  static final jump = AudioPlayer()
    ..setSource(AssetSource('audio/jump.wav')); // Jump
  static final hurt = AudioPlayer()
    ..setSource(AssetSource('audio/hurt.mp3')); // Hurt
  static final death = AudioPlayer()
    ..setSource(AssetSource('audio/death.mp3')); // Hurt
}
