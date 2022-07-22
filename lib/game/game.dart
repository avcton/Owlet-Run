import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:my_game/game/dust.dart';
import 'package:my_game/game/owlet.dart';

class TinyGame extends FlameGame {
  late Owlet _owlet; // Animations for the Owlet
  late WalkDust _walkDust; // Dust Animations
  late ParallaxComponent _parallaxComponent; // Map

  @override
  Future<void>? onLoad() async {
    _owlet = await Owlet.create();
    _walkDust = await WalkDust.create();

    _parallaxComponent = await loadParallaxComponent(
      [
        // Parallax Forest Background
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
      baseVelocity: Vector2(0.5, 0), // Map Move Speed
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );

    add(_parallaxComponent);
    add(_owlet);
    add(_walkDust);
    return super.onLoad();
  }
}
