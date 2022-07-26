import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:my_game/game/game.dart';
import 'package:my_game/packages/enemy_generator.dart';
import 'package:my_game/screens/main_menu.dart';

Widget gameOver(BuildContext context, TinyGame gameref) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: Card(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(gameref.size.y - gameref.size.y * 90 / 100),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Game Over",
              style: TextStyle(
                fontSize: gameref.size.y - gameref.size.y * 92 / 100,
                fontFamily: "Audiowide",
                color: Colors.white,
              ),
            ),
            SizedBox(height: gameref.size.y - gameref.size.y * 99 / 100),
            Text(
              "Your Score is",
              style: TextStyle(
                fontSize: gameref.size.y - gameref.size.y * 95 / 100,
                fontFamily: "Audiowide",
                color: Colors.white,
              ),
            ),
            SizedBox(height: gameref.size.y - gameref.size.y * 95 / 100),
            Text(
              gameref.score.toStringAsFixed(0),
              style: TextStyle(
                fontSize: gameref.size.y - gameref.size.y * 90 / 100,
                fontFamily: "Audiowide",
                color: Colors.yellow,
              ),
            ),
            SizedBox(height: gameref.size.y - gameref.size.y * 97 / 100),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                gameref.overlays.remove('Game Over');

                TinyGame.player.resume();
                gameref.enemyGenerator.resetTimer();
                EnemyGenerator.spawnLevel = 0;
                gameref.enemyGenerator.removeAllEnemy();
                gameref.score = 0;
                gameref.owlet.life.value = 3;
                gameref.addAll([gameref.scoreTitle, gameref.scoreComponent]);
                gameref.currentSpeed = 0.2;
                gameref.parallaxComponent.parallax?.baseVelocity =
                    Vector2(gameref.currentSpeed, 0);

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
            ),
            SizedBox(height: gameref.size.y - gameref.size.y * 98 / 100),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                MainMenu.player.play('menu.mp3');
                TinyGame.player.stop();
                Navigator.pop(context);
              },
              child: Text(
                "Main Menu",
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
