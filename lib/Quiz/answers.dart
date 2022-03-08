import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Color _answerColor = const Color(0xFFD6CFCB); // Timberwolf
  final List<Map<String, Object>> _answers;
  final String _imgPath;
  final Function() _answerQuestion;

  const Answers(this._answers, this._imgPath, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
          child: Image.asset(
            _imgPath,
            scale: 0.91,
          ),
        ),
        Row(
          children: [
            Container(
              width: 160,
              height: 90,
              margin: const EdgeInsets.fromLTRB(0, 10, 12, 10),
              child: ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(
                  _answers[0]['text'] as String,
                  style: const TextStyle(
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
                onPressed: _answerQuestion,
                child: Text(
                  _answers[1]['text'] as String,
                  style: const TextStyle(
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
                onPressed: _answerQuestion,
                child: Text(
                  _answers[2]['text'] as String,
                  style: const TextStyle(
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
                onPressed: _answerQuestion,
                child: Text(
                  _answers[3]['text'] as String,
                  style: const TextStyle(
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
