import 'package:flutter/material.dart';
import 'package:my_game/packages/audio_player.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.black,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Stack(children: [
          Center(
              child: Card(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: EdgeInsets.all(size.width - size.width * 95 / 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Credits",
                      style: TextStyle(
                        fontSize: size.height - size.height * 90 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  SizedBox(height: size.height - size.height * 98 / 100),
                  Text("Artwork",
                      style: TextStyle(
                        fontSize: size.height - size.height * 96 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  Text("edermuniz",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.yellow,
                      )),
                  SizedBox(height: size.height - size.height * 98 / 100),
                  Text("Music",
                      style: TextStyle(
                        fontSize: size.height - size.height * 96 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  Text("ZapsPlat",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.yellow,
                      )),
                  SizedBox(height: size.height - size.height * 98 / 100),
                  Text("Made by",
                      style: TextStyle(
                        fontSize: size.height - size.height * 96 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  Text("avcton",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.yellow,
                      )),
                ],
              ),
            ),
          )),
          Positioned(
              child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 40,
            ),
            alignment: Alignment.topLeft,
            onPressed: () {
              // FlameAudio.play('click.wav');
              AudioSfx.click.resume();
              Navigator.pop(context);
            },
          )),
        ]),
      ),
    );
  }
}
