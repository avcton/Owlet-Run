import 'package:flutter/material.dart';

class AppFeedback extends StatelessWidget {
  const AppFeedback({Key? key}) : super(key: key);

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
            child: const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  "avcton@gmail.com",
                  style: TextStyle(
                      fontFamily: 'Audiowide',
                      color: Colors.blue,
                      fontSize: 18),
                )),
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
