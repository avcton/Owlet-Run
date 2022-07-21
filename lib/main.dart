import 'package:flame/flame.dart';
import 'package:flame/game.dart';
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
      title: "Tiny Forest Heroes",
      home: MyGameApp(),
    );
  }
}

class MyGameApp extends StatefulWidget {
  const MyGameApp({Key? key}) : super(key: key);

  @override
  State<MyGameApp> createState() => _MyGameAppState();
}

class _MyGameAppState extends State<MyGameApp> {
  late TinyGame _myGame;

  @override
  void initState() {
    _myGame = TinyGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _myGame);
  }
}
