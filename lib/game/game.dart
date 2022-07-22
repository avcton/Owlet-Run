import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:my_game/game/owlet.dart';

class TinyGame extends FlameGame with TapDetector {
  late Owlet _owlet; // Animations for the Owlet
  late ParallaxComponent _parallaxComponent; // Map

  @override
  Future<void>? onLoad() async {
    _owlet = await Owlet.create();

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
      baseVelocity: Vector2(0.2, 0), // Map Move Speed
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    addAll([_parallaxComponent, _owlet, _owlet.dust]);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (!_owlet.onGround()) {
      _owlet.dust.jumpDust();
    }
    if (_owlet.onGround()) {
      _owlet.dust.runDust();
    }
    super.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    _owlet.jump();
    super.onTapDown(info);
  }
}
