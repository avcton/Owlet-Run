import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

enum EnemyType { angryPig, bunny, chicken, rino }

class EnemyDetails {
  final String imageName;
  final double x, y;

  EnemyDetails({required this.imageName, required this.x, required this.y});
}

class Enemy extends SpriteAnimationComponent {
  late Vector2 sz;
  static const double speed = 200.0;
  static late SpriteAnimation _runAnimation; // Run

  static Map<EnemyType, EnemyDetails> enemyDetails = {
    EnemyType.angryPig:
        EnemyDetails(imageName: 'AngryPig/Walk (36x30).png', x: 36, y: 30),
    EnemyType.bunny:
        EnemyDetails(imageName: 'Bunny/Run (34x44).png', x: 34, y: 44),
    EnemyType.chicken:
        EnemyDetails(imageName: 'Chicken/Run (32x34).png', x: 32, y: 34),
    EnemyType.rino:
        EnemyDetails(imageName: 'Rino/Run (52x34).png', x: 52, y: 34),
  };

  Enemy();

  static Future<Enemy> create(EnemyType enemyType) async {
    final enemy = Enemy();
    final enemyData = enemyDetails[enemyType];

    // Run Animation initialization
    Image enemyImage = await Flame.images.load(enemyData!.imageName);
    final runSprite = SpriteSheet(
        image: enemyImage, srcSize: Vector2(enemyData.x, enemyData.y));

    _runAnimation = runSprite.createAnimation(row: 0, stepTime: 0.1);

    enemy.animation = _runAnimation;
    return enemy;
  }

  @override
  void onGameResize(Vector2 size) {
    sz = size;
    height = width = size.y / 7; //        1/7.5 of the screen's height
    x = size.x + width;
    y = size.y - size.y * 24.5 / 100;
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    x -= speed * dt;

    // If enemy reaches the end of the screen
    if (x < -width) {
      x = sz.x + width;
    }
    super.update(dt);
  }
}
