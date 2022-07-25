import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

enum EnemyType { angryPig, bunny, chicken, rino, bat }

class EnemyDetails {
  final String imageName;
  final bool canFly;
  final int speed;
  final double x, y;

  EnemyDetails(
      {required this.imageName,
      required this.x,
      required this.y,
      required this.canFly,
      required this.speed});
}

class Enemy extends SpriteAnimationComponent with CollisionCallbacks {
  static late EnemyDetails? enemyData;
  static late SpriteAnimation _runAnimation; // Run
  static final Random _random = Random();

  static Map<EnemyType, EnemyDetails> enemyDetails = {
    EnemyType.angryPig: EnemyDetails(
        imageName: 'AngryPig/Walk (36x30).png',
        x: 36,
        y: 30,
        canFly: false,
        speed: 300),
    EnemyType.bunny: EnemyDetails(
        imageName: 'Bunny/Run (34x44).png',
        x: 34,
        y: 44,
        canFly: false,
        speed: 350),
    EnemyType.chicken: EnemyDetails(
        imageName: 'Chicken/Run (32x34).png',
        x: 32,
        y: 34,
        canFly: false,
        speed: 250),
    EnemyType.rino: EnemyDetails(
        imageName: 'Rino/Run (52x34).png',
        x: 52,
        y: 34,
        canFly: false,
        speed: 200),
    EnemyType.bat: EnemyDetails(
        imageName: 'Bat/Flying (46x30).png',
        x: 46,
        y: 30,
        canFly: true,
        speed: 300)
  };

  Enemy();

  static Future<Enemy> create(EnemyType enemyType) async {
    final enemy = Enemy();
    enemyData = enemyDetails[enemyType];

    // Run Animation initialization
    Image enemyImage = await Flame.images.load(enemyData!.imageName);
    final runSprite = SpriteSheet(
        image: enemyImage, srcSize: Vector2(enemyData!.x, enemyData!.y));

    _runAnimation = runSprite.createAnimation(row: 0, stepTime: 0.1);

    enemy.animation = _runAnimation;
    return enemy;
  }

  @override
  void onGameResize(Vector2 size) {
    height = width = size.y /
        8; //        1/8 of the screen's height - matching that of owlet's height
    x = size.x + width;
    y = size.y - size.y * 22 / 100;

    if (enemyData!.canFly && _random.nextBool()) {
      y -= height;
    }

    super.onGameResize(size);
  }

  @override
  void onMount() {
    add(RectangleHitbox.relative(Vector2(0.5, 0.8), parentSize: size));
    super.onMount();
  }

  @override
  void update(double dt) {
    x -= enemyData!.speed * dt;

    // If enemy reaches the end of the screen -- remove it
    if (x < -width) {
      removeFromParent();
    }
    super.update(dt);
  }
}
