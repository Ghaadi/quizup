import 'package:flutter/material.dart';
import 'dart:async';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';
import './menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _timeLeft = 10;
  var _score1 = 0;
  var _score2 = 0;
  var player1 = 0;
  var name = "player 1";
  var _isPlaying = false;

  //timer function

  void _startPlaying() {
    setState(() {
      _isPlaying = true;
      _startCountDown();
    });
  }

  void _stopPlaying() {
    setState(() {
      _isPlaying = false;
      _resetQuiz();
    });
  }

  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {

      if (_timeLeft > 0 && _questionIndex <= 5) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        _timeLeft = 10;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _timeLeft = 10;
      _score1 = 0;
      _score2 = 0;
      name = "player 1";
      if(_isPlaying) {
        _startCountDown();
      }
    });
  }

  final questions = const [
    {
      'questionText': 'Who is the president of America',
      'answers': [
        {'text': 'clint eastwood', 'score': 0},
        {'text': 'tom hanks', 'score': 0},
        {'text': 'joe biden', 'score': 1}
      ]
    },
    {
      'questionText': 'Who created Microsoft',
      'answers': [
        {'text': 'Bill Gates', 'score': 1},
        {'text': 'Donald Trump', 'score': 0},
        {'text': 'Steve Jobs', 'score': 0}
      ]
    },
    {
      'questionText': 'Where is Beirut ',
      'answers': [
        {'text': 'Brazil', 'score': 0},
        {'text': 'Emirates', 'score': 0},
        {'text': 'Lebanon', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is the president of America',
      'answers': [
        {'text': 'clint eastwood', 'score': 0},
        {'text': 'tom hanks', 'score': 0},
        {'text': 'joe biden', 'score': 1}
      ]
    },
    {
      'questionText': 'Who created Microsoft',
      'answers': [
        {'text': 'Bill Gates', 'score': 1},
        {'text': 'Donald Trump', 'score': 0},
        {'text': 'Steve Jobs', 'score': 0}
      ]
    },
    {
      'questionText': 'Where is Beirut ',
      'answers': [
        {'text': 'Brazil', 'score': 0},
        {'text': 'Emirates', 'score': 0},
        {'text': 'Lebanon', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < 3) {
      _score1 += score;
    } else {
      _score2 += score;
    }
    setState(() {
      if (_questionIndex > 1) {
        name = "player 2";
      }
      _questionIndex++;

      _timeLeft = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: (!_isPlaying)
            ? Menu(_startPlaying)
            : _questionIndex < questions.length
                ? Column(
                    children: [
                      Quiz(
                        questions: questions,
                        answerquestion: _answerQuestion,
                        questionindex: _questionIndex,
                      ),
                      Text(
                        _timeLeft.toString(),
                        style:
                            const TextStyle(fontSize: 35, color: Colors.blue),
                      ),
                      Text(
                        name,
                        style:
                            const TextStyle(fontSize: 35, color: Colors.blue),
                      ),
                    ],
                  )
                : Result(_score1, _score2, _resetQuiz, _stopPlaying),
      ),
    );
  }
}
