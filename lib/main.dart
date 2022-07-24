import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_game/game/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Owlet Run",
      home: MyGameApp(),
    );
  }
}

class MyGameApp extends StatefulWidget {
  const MyGameApp({Key? key}) : super(key: key);

  @override
  State<MyGameApp> createState() => _MyGameAppState();
}

class _MyGameAppState extends State<MyGameApp>
    with SingleTickerProviderStateMixin {
  late TinyGame _myGame;
  late AnimationController _animationController;

  @override
  void initState() {
    _myGame = TinyGame();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
        onFinish: (context) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) => GameWidget(
                      game: _myGame,
                      overlayBuilderMap: {
                        'Pause Button': pauseButton,
                      },
                    )))),
        theme: FlameSplashTheme.dark);
  }

  Widget pauseButton(context, game) {
    return Material(
      elevation: 100,
      color: Colors.transparent,
      child: Padding(
        padding:
            EdgeInsets.only(top: _myGame.size.y - _myGame.size.y * 90 / 100),
        child: GestureDetector(
          onTap: playPauseTapped,
          child: AnimatedIcon(
            color: Colors.white,
            size: _myGame.size.y / 8,
            icon: AnimatedIcons.pause_play,
            progress: _animationController,
          ),
        ),
      ),
    );
  }

  void playPauseTapped() {
    if (_myGame.isPaused) {
      _animationController.reverse();
      _myGame.resumeEngine();
      _myGame.isPaused = false;
    } else {
      _animationController.forward();
      _myGame.pauseEngine();
      _myGame.isPaused = true;
    }
  }
}
