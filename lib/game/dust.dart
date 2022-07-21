import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class WalkDust extends SpriteAnimationComponent {
  WalkDust({required Image sprite, required Vector2 vec}) {
    final walkSprite = SpriteSheet(image: sprite, srcSize: vec);
    final dustAnimation = walkSprite.createAnimation(row: 0, stepTime: 0.2);

    animation = dustAnimation;
    size = vec;
    position = Vector2.all(100);
  }

  @override
  void onGameResize(Vector2 size) {
    height = width = size.y / 10;
    x = size.x - size.x * 86.5 / 100;
    y = size.y - size.y * 18 / 100;
    super.onGameResize(size);
  }
}
