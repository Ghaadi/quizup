import 'package:flutter/material.dart';

class NoImageAnswers extends StatelessWidget {
  final Color _answerColor;
  final List<Map<String, Object>> _answers;
  final Function(int) _answerQuestion;

  const NoImageAnswers(this._answers, this._answerQuestion, this._answerColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          height: 80,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: ElevatedButton(
            onPressed: () => _answerQuestion(_answers[0]['points'] as int),
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
          width: 330,
          height: 80,
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ElevatedButton(
            onPressed: () => _answerQuestion(_answers[1]['points'] as int),
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
        Container(
          width: 330,
          height: 80,
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ElevatedButton(
            onPressed: () => _answerQuestion(_answers[2]['points'] as int),
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
          width: 330,
          height: 80,
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: ElevatedButton(
            onPressed: () => _answerQuestion(_answers[3]['points'] as int),
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
        ),
      ],
    );
  }
}
