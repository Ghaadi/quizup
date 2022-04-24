import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;

  const Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.7 * MediaQuery.of(context).size.width / 3,
      alignment: Alignment.center,
      // margin: const EdgeInsets.fromLTRB(0, 40, 0, 50),
      margin: EdgeInsets.fromLTRB(
        0,
        MediaQuery.of(context).size.height / 17.1,
        0,
        MediaQuery.of(context).size.height / 13.67 + 15 * (3 - _question.length / 20),
      ),
      child: Flexible(
        child: Text(
          _question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
