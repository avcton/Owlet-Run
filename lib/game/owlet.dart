import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:my_game/game/dust.dart';
import 'package:my_game/game/enemy.dart';

class Owlet extends SpriteAnimationComponent with CollisionCallbacks {
  late Dust dust; // Dust of the Owlet

  static late SpriteAnimation _idleAnimation; // idle
  static late SpriteAnimation _runAnimation; // Run
  static late SpriteAnimation _hurtAnimation; // Hurt
  static late SpriteAnimation _deathAnimation; // Death

  static const gravity = 1000;
  late double speedY, initialV;
  bool isHit = false;
  late Timer _timer;
  late ValueNotifier<int> life;
  double skyToGround = 0.0; // Distance from sky to the ground

  Owlet() {
    life = ValueNotifier(3); // 3 Lives
    _timer = Timer(1, onTick: () {
      // Hurt animation for 1 second
      isHit = false;
      run();
    });
  }

  static Future<Owlet> create() async {
    final owl = Owlet();

    // Idle Animation initialization
    Image owletIdleImage =
        await Flame.images.load('Owlet_Monster/Owlet_Monster_Jump_8.png');
    final idleSprite =
        SpriteSheet(image: owletIdleImage, srcSize: Vector2(32, 32));
    _idleAnimation = idleSprite.createAnimation(row: 0, stepTime: 0.1);

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
    owl.dust = await Dust.create();
    return owl;
  }

  @override
  void onGameResize(Vector2 size) {
    speedY = initialV = -200 - (size.y); // Equation to get initial velocity
    height = width = size.y / 7; //        1/7 of the screen's height
    x = size.x - size.x * 81 / 100;
    y = size.y - size.y * 24 / 100;
    skyToGround = y;
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    // Formula to calculate final y-velocity : vf = vi + gt
    speedY = speedY + gravity * dt;

    // Formula to calculate distance on behalf of final velocity: S = vt
    var distance = speedY * dt;

    // Adding the calculated height as the jump height
    y += distance;

    // Reseting the Y components when falling beneath the ground
    if (onGround()) {
      run();
      y = skyToGround;
      speedY = 0.0;
    }

    _timer.update(dt);
    super.update(dt);
  }

  @override
  void onMount() {
    add(RectangleHitbox.relative(Vector2(0.6, 0.8), parentSize: size));
    super.onMount();
  }

  bool onGround() {
    return y >= skyToGround;
  }

  // Animation change functions
  void idle() {
    animation = _idleAnimation;
  }

  void run() {
    if (!isHit) {
      animation = _runAnimation;
    }
  }

  void hurt() {
    animation = _hurtAnimation;
  }

  void die() {
    animation = _deathAnimation;
  }

  void jump() {
    if (onGround()) {
      !isHit ? idle() : hurt();
      speedY = initialV;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if ((other is Enemy && !isHit)) {
      hurt();
      life.value -= 1;
      isHit = true;
      _timer.start();
    }
    super.onCollision(intersectionPoints, other);
  }
}
