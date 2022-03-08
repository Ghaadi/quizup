import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2 * MediaQuery.of(context).size.width / 3,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 50),
      child: const Text(
        "What country does this flag represent?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
