import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class Dust extends SpriteAnimationComponent {
  bool active;
  late Vector2 sz;

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
    sz = size;
    height = width = size.y / 8;
    if (animation == _runDustAnimation) {
      x = sz.x - sz.x * 82.5 / 100;
      y = sz.y - sz.y * 22.5 / 100;
    } else if (animation == _jumpDustAnimation) {
      x = sz.x - sz.x * 80.5 / 100;
      y = sz.y - sz.y * 21.5 / 100;
    }
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    if (animation == _runDustAnimation) {
      x = sz.x - sz.x * 82.5 / 100;
      y = sz.y - sz.y * 22.5 / 100;
    } else if (animation == _jumpDustAnimation) {
      x = sz.x - sz.x * 80.5 / 100;
      y = sz.y - sz.y * 21.5 / 100;
    }
    super.update(dt);
  }

  void runDust() {
    animation = _runDustAnimation;
  }

  void jumpDust() {
    animation = _jumpDustAnimation;
  }
}
