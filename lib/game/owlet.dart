import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class Owlet extends SpriteAnimationComponent {
  Owlet({required Image sprite, required Vector2 vec}) {
    final runSprite = SpriteSheet(image: sprite, srcSize: vec);
    final runAnimation = runSprite.createAnimation(row: 0, stepTime: 0.1);

    animation = runAnimation;
    size = vec;
    position = Vector2.all(100);
  }

  @override
  void onGameResize(Vector2 size) {
    height = width = size.y / 10;
    x = size.x - size.x * 85 / 100;
    y = size.y - size.y * 18 / 100;
    super.onGameResize(size);
  }
}
