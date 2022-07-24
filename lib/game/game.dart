import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_game/game/owlet.dart';
import 'package:my_game/packages/enemy_generator.dart';

class TinyGame extends FlameGame
    with KeyboardEvents, TapDetector, HasCollisionDetection {
  late Owlet _owlet; // Animations for the Owlet
  late EnemyGenerator enemyGenerator;
  late ParallaxComponent _parallaxComponent; // Map
  late TextComponent scoreComponent;
  late TextComponent scoreTitle;
  late double score;
  bool isPaused = false;

  TinyGame() {
    enemyGenerator = EnemyGenerator();
    scoreComponent = TextComponent();
    scoreTitle = TextComponent();
  }

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

    score = 0;
    scoreTitle = TextComponent(
      text: "Score",
      textRenderer: TextPaint(
          style: TextStyle(
              fontFamily: 'Audiowide', fontSize: size.y - size.y * 90 / 100)),
    );

    scoreComponent = TextComponent(
        text: score.toStringAsFixed(0),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
            style: TextStyle(
                fontFamily: 'Audiowide',
                fontSize: size.y - size.y * 94 / 100,
                color: Colors.yellow)));

    addAll([
      _parallaxComponent,
      _owlet,
      _owlet.dust,
      enemyGenerator,
      scoreTitle,
      scoreComponent,
    ]);

    overlays.add("Pause Button");

    onGameResize(canvasSize);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // Score Manipulation
    score += 60 * dt;
    scoreComponent.text = score.toStringAsFixed(0);

    // Smoke run / jump Animation
    if (!_owlet.onGround()) {
      _owlet.dust.jumpDust();
    }
    if (_owlet.onGround()) {
      _owlet.dust.runDust();
    }

    super.update(dt);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    // Score Title Resizing
    scoreTitle.x = canvasSize.x / 2 -
        scoreComponent.width / 2 -
        (canvasSize.x - canvasSize.x * 93 / 100);
    scoreTitle.y = canvasSize.y - canvasSize.y * 88 / 100;

    // Score Resizing
    scoreComponent.x = canvasSize.x / 2 - scoreComponent.width / 2;
    scoreComponent.y = canvasSize.y - canvasSize.y * 75 / 100;
    super.onGameResize(canvasSize);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // Screen Touch Taps
    _owlet.jump();
    super.onTapDown(info);
  }

  @override
  KeyEventResult onKeyEvent(
      // Keyboard Space Taps
      RawKeyEvent event,
      Set<LogicalKeyboardKey> keysPressed) {
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace) {
      _owlet.jump();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}
