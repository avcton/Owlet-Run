import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_game/game/game.dart';
import 'package:my_game/screens/game_over.dart';
import 'package:my_game/screens/lives.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: "Owlet Run",
      home: MyGameApp(),
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(
        fontFamily: "Audiowide",
        color: Colors.white,
      ))),
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
                        'Lives': (context, game) {
                          return livesHud(_myGame);
                        },
                        'Game Over': (context, game) {
                          return gameOver(_myGame);
                        }
                      },
                    )))),
        theme: FlameSplashTheme.dark);
  }

  Widget pauseButton(context, game) {
    return Material(
      elevation: 100,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
            top: _myGame.size.y - _myGame.size.y * 88 / 100,
            left: _myGame.size.x - _myGame.size.x * 95 / 100),
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
