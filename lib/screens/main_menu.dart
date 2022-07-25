import 'package:flutter/material.dart';
import 'package:my_game/main.dart';
import 'package:my_game/screens/about.dart';
import 'package:my_game/screens/feedback.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Card(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(size.width - size.width * 93 / 100),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Owlet Run",
                  style: TextStyle(
                    fontSize: size.height - size.height * 90 / 100,
                    fontFamily: "Audiowide",
                    color: Colors.yellow,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyGameApp()),
                    );
                  },
                  color: Colors.blue,
                  child: Text("Play",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutApp()),
                    );
                  },
                  color: Colors.blue,
                  child: Text("About",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppFeedback()),
                    );
                  },
                  color: Colors.blue,
                  child: Text("Feedback",
                      style: TextStyle(
                        fontSize: size.height - size.height * 95 / 100,
                        fontFamily: "Audiowide",
                        color: Colors.white,
                      )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
