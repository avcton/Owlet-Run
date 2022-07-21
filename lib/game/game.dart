import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/parallax.dart';
import 'package:my_game/game/dust.dart';
import 'package:my_game/game/owlet.dart';

class TinyGame extends FlameGame {
  late Owlet _owlet; // Animations for the Owlet
  late WalkDust _walkDust;
  late ParallaxComponent _parallaxComponent;

  @override
  Future<void>? onLoad() async {
    Image owletImage =
        await images.load('Owlet_Monster/Owlet_Monster_Run_6.png');
    Image dustImage =
        await images.load('Owlet_Monster/Walk_Run_Push_Dust_6.png');

    _owlet = Owlet(sprite: owletImage, vec: Vector2(32, 32));
    _walkDust = WalkDust(sprite: dustImage, vec: Vector2(32, 32));

    _parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData('Background/Layer_0011_0.png'),
        ParallaxImageData('Background/Layer_0010_1.png'),
        ParallaxImageData('Background/Layer_0009_2.png'),
        ParallaxImageData('Background/Layer_0008_3.png'),
        ParallaxImageData('Background/Layer_0007_Lights.png'),
        ParallaxImageData('Background/Layer_0006_4.png'),
        ParallaxImageData('Background/Layer_0005_5.png'),
        ParallaxImageData('Background/Layer_0004_Lights.png'),
        ParallaxImageData('Background/Layer_0003_6.png'),
        ParallaxImageData('Background/Layer_0002_7.png'),
        ParallaxImageData('Background/Layer_0001_8.png'),
        ParallaxImageData('Background/Layer_0000_9.png'),
      ],
      baseVelocity: Vector2(0.5, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );

    add(_parallaxComponent);
    add(_owlet);
    add(_walkDust);
    return super.onLoad();
  }
}
