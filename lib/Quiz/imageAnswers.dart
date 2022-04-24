import 'package:flutter/material.dart';

class ImageAnswers extends StatelessWidget {
  final Color _answerColor;
  final List<Map<String, dynamic>> _answers;
  final _imgPath;
  final Function(int) _answerQuestion;

  const ImageAnswers(
    this._answers,
    this._imgPath,
    this._answerQuestion,
    this._answerColor,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.21,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
          child: Image.asset(
            _imgPath,
            fit: BoxFit.fill,
            // scale: MediaQuery.of(context).size.width * MediaQuery.of(context).size.height / 308992.97,
            // scale: 0.99,
          ),
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.57,
              height: MediaQuery.of(context).size.height / 7.59,
              margin: const EdgeInsets.fromLTRB(0, 10, 12, 10),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(_answers[0]['points'] as int),
                child: Text(
                  _answers[0]['text'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.57,
              height: MediaQuery.of(context).size.height / 7.59,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(_answers[1]['points'] as int),
                child: Text(
                  _answers[1]['text'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
              width: MediaQuery.of(context).size.width / 2.57,
              height: MediaQuery.of(context).size.height / 7.59,
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 10),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(_answers[2]['points'] as int),
                child: Text(
                  _answers[2]['text'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: _answerColor,
                  onPrimary: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.57,
              height: MediaQuery.of(context).size.height / 7.59,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(_answers[3]['points'] as int),
                child: Text(
                  _answers[3]['text'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
