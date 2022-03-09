import 'package:flutter/material.dart';
import 'package:quizup_prototype/Quiz/imageAnswers.dart';
import 'package:quizup_prototype/Quiz/noImageAnswers.dart';

class Answers extends StatelessWidget {
  // final Color _answerColor = const Color(0xFFD6CFCB); // Timberwolf
  final Color _answerColor = const Color(0xFFEDF4F5); // Ice White
  final List<Map<String, Object>> _answers;
  final _imgPath;
  final Function(int) _answerQuestion;

  const Answers(this._answers, this._imgPath, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return (_imgPath != null)
        ? ImageAnswers(_answers, _imgPath, _answerQuestion, _answerColor)
        : NoImageAnswers(_answers, _answerQuestion, _answerColor);
  }
}
