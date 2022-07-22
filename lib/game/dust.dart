import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class WalkDust extends SpriteAnimationComponent {
  WalkDust();

  static Future<WalkDust> create() async {
    final WalkDust dust = WalkDust();
    Image dustImage =
        await Flame.images.load('Owlet_Monster/Walk_Run_Push_Dust_6.png');
    final dustSprite = SpriteSheet(image: dustImage, srcSize: Vector2(32, 32));
    final dustAnimation = dustSprite.createAnimation(row: 0, stepTime: 0.2);

    dust.animation = dustAnimation;
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
}
