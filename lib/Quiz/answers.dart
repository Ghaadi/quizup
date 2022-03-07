import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Color _answerColor = const Color(0xFFD6CFCB); // Timberwolf

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Image.asset(
            "./imgs/usa.png",
            scale: 0.36,
          ),
        ),
        Row(
          children: [
            Container(
              width: 160,
              height: 90,
              margin: const EdgeInsets.fromLTRB(0, 10, 12, 10),
              child: ElevatedButton(
                onPressed: () => print("clicked!"),
                child: const Text(
                  "Lebanon",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            ),
            Container(
              width: 160,
              height: 90,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () => print("clicked!"),
                child: const Text(
                  "USA",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 160,
              height: 90,
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 10),
              child: ElevatedButton(
                onPressed: () => print("clicked!"),
                child: const Text(
                  "Australia",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            ),
            Container(
              width: 160,
              height: 90,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ElevatedButton(
                onPressed: () => print("clicked!"),
                child: const Text(
                  "Canada",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
