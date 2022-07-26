import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:my_game/game/game.dart';

Widget livesHud(TinyGame gameref) {
  return ValueListenableBuilder(
    valueListenable: gameref.owlet.life,
    builder: (BuildContext context, int value, Widget? child) {
      List<Widget> list = [];
      if (value <= 0) {
        FlameAudio.play('death.mp3', volume: 70);
      }
      for (int i = 0; i < 3; i++) {
        list.add(Icon(
          Icons.favorite,
          color: i < value ? Colors.red : Colors.black,
          size: gameref.size.y / 10,
        ));
      }
      return Padding(
        padding: EdgeInsets.only(
          top: gameref.size.y - gameref.size.y * 88 / 100,
          right: gameref.size.x - gameref.size.x * 95 / 100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: list,
        ),
      );
    },
  );
}
