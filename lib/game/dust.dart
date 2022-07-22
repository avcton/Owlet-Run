import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class Dust extends SpriteAnimationComponent {
  bool active;

  static late SpriteAnimation _runDustAnimation;
  static late SpriteAnimation _jumpDustAnimation;

  Dust() : active = true;

  static Future<Dust> create() async {
    final Dust dust = Dust();

    // Run Dust Animation
    Image runDustImage =
        await Flame.images.load('Owlet_Monster/Walk_Run_Push_Dust_6.png');
    final runDustSprite =
        SpriteSheet(image: runDustImage, srcSize: Vector2(32, 32));
    _runDustAnimation = runDustSprite.createAnimation(row: 0, stepTime: 0.2);

    // Jump Dust Animation
    Image jumpDustImage =
        await Flame.images.load('Owlet_Monster/Double_Jump_Dust_5.png');
    final jumpDustSprite =
        SpriteSheet(image: jumpDustImage, srcSize: Vector2(32, 32));
    _jumpDustAnimation = jumpDustSprite.createAnimation(row: 0, stepTime: 0.2);

    dust.animation = _runDustAnimation; // default to running dust
    dust.size = Vector2(32, 32);
    dust.position = Vector2.all(100);

    return dust;
  }

  @override
  void onGameResize(Vector2 size) {
    height = width = size.y / 10;
    x = size.x - size.x * 86.5 / 100;
    y = size.y - size.y * 18 / 100;
    super.onGameResize(size);
  }

  void runDust() {
    animation = _runDustAnimation;
  }

  void jumpDust() {
    animation = _jumpDustAnimation;
  }
}
