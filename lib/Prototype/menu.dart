import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Function() startPlaying;

  const Menu(this.startPlaying);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "QuizUp",
                style: TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonBox(
              child: ElevatedButton(
                onPressed: startPlaying,
                child: const Text(
                  "Play",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: null,
                child: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonBox(
              child: const ElevatedButton(
                onPressed: null,
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget titleBox({required Widget child}) => Container(
        margin: const EdgeInsets.fromLTRB(0, 80, 0, 100),
        child: child,
      );

  Widget buttonBox({required Widget child}) => Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: child,
      );
}
