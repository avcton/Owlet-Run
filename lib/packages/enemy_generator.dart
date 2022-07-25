import 'dart:math';
import 'package:flame/components.dart';
import 'package:my_game/game/enemy.dart';
import 'package:my_game/game/game.dart';

class EnemyGenerator extends Component with HasGameRef<TinyGame> {
  late Random _rand;
  late Timer _timer;
  static int spawnLevel = 0;

  EnemyGenerator() {
    _rand = Random();
    resetTimer();
  }

  void resetTimer() {
    _timer = Timer(3, repeat: true, onTick: () {
      // 3 secs to next enemy generated
      spawnEnemy();
    });
  }

  void spawnEnemy() async {
    final randNum = _rand.nextInt(EnemyType.values.length);
    final randEnemyType = EnemyType.values.elementAt(randNum);
    final randEnemy = await Enemy.create(randEnemyType);
    gameRef.add(randEnemy);
  }

  @override
  void onMount() {
    _timer.start();
    super.onMount();
  }

  @override
  void update(double dt) {
    _timer.update(dt);

    var newSpawnLevel = gameRef.score ~/ 300;
    if (newSpawnLevel > spawnLevel) {
      spawnLevel = newSpawnLevel;
      gameRef.parallaxComponent.parallax?.baseVelocity = Vector2(
          gameRef.currentSpeed += spawnLevel / 500,
          0); // Increasing the map speed w.r.t enemy spawning

      var newWaitTime = (4 / (1 + (0.1 * spawnLevel)));
      _timer.stop();
      _timer = Timer(newWaitTime, repeat: true, onTick: () {
        // New wait time to next enemy generated
        spawnEnemy();
      });
      _timer.start();
    }
    super.update(dt);
  }

  void removeAllEnemy() {
    final enemies = gameRef.children.whereType<Enemy>();
    for (var enemy in enemies) {
      enemy.removeFromParent();
    }
  }
}
