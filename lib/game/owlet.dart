import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';

class Owlet extends SpriteAnimationComponent {
  static late SpriteAnimation _runAnimation; // Run
  static late SpriteAnimation _hurtAnimation; // Hurt
  static late SpriteAnimation _deathAnimation; // Death

  Owlet();

  static Future<Owlet> create() async {
    final owl = Owlet();

    // Run Animation initialization
    Image owletRunImage =
        await Flame.images.load('Owlet_Monster/Owlet_Monster_Run_6.png');
    final runSprite =
        SpriteSheet(image: owletRunImage, srcSize: Vector2(32, 32));
    _runAnimation = runSprite.createAnimation(row: 0, stepTime: 0.1);

    // Hurt Animation initialization
    Image owletHurtImage =
        await Flame.images.load('Owlet_Monster/Owlet_Monster_Hurt_4.png');
    final hurtSprite =
        SpriteSheet(image: owletHurtImage, srcSize: Vector2(32, 32));
    _hurtAnimation = hurtSprite.createAnimation(row: 0, stepTime: 0.1);

    // Death Animation initialization
    Image owletDeathImage =
        await Flame.images.load('Owlet_Monster/Owlet_Monster_Death_8.png');
    final deathSprite =
        SpriteSheet(image: owletDeathImage, srcSize: Vector2(32, 32));
    _deathAnimation = deathSprite.createAnimation(row: 0, stepTime: 0.1);

    owl.animation = _runAnimation; // default animation is to run
    owl.size = Vector2(32, 32);
    owl.position = Vector2.all(100);

    return owl;
  }

  @override
  void onGameResize(Vector2 size) {
    height = width = size.y / 10; // 1/10th of the screen's height
    x = size.x - size.x * 85 / 100;
    y = size.y - size.y * 18 / 100;
    super.onGameResize(size);
  }
}
