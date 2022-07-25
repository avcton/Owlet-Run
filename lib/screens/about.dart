import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Credits",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  SizedBox(height: 10),
                  Text("Artwork",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  Text("edermuniz",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Audiowide",
                        color: Colors.yellow,
                      )),
                  SizedBox(height: 20),
                  Text("Made by",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                  Text("avcton",
                      style: TextStyle(
                        fontSize: 22,
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
              Navigator.pop(context);
            },
          )),
        ]),
      ),
    );
  }
}
