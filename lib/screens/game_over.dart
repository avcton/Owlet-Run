import 'package:flutter/material.dart';
import 'package:my_game/game/game.dart';

Widget gameOver(TinyGame gameref) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: Card(
        color: Colors.black.withOpacity(0.6),
        child: Padding(
          padding: EdgeInsets.all(gameref.size.y - gameref.size.y * 92 / 100),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Game Over",
              style: TextStyle(
                fontSize: gameref.size.y - gameref.size.y * 92 / 100,
                fontFamily: "Audiowide",
                color: Colors.white,
              ),
            ),
            Text(
              "Your Score is ${gameref.score.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: gameref.size.y - gameref.size.y * 95 / 100,
                fontFamily: "Audiowide",
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                gameref.overlays.remove('Game Over');

                gameref.score = 0;
                gameref.owlet.life.value = 3;
                gameref.enemyGenerator.removeAllEnemy();

                gameref.resumeEngine();
              },
              child: Text(
                "Retry",
                style: TextStyle(
                  fontSize: gameref.size.y - gameref.size.y * 95 / 100,
                  fontFamily: "Audiowide",
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
