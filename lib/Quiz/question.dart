import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;

  const Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2 * MediaQuery.of(context).size.width / 3,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 50),
      child: Text(
        _question,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
