import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:async';

import './answers.dart';
import './question.dart';
import './linearTimer.dart';
import './header.dart';
import './circularTimer.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  final Color _playerColor = Colors.red;
  final Color _opponentColor = Colors.blue;
  final Color _backgroundColor = const Color(0xFF2E3532);
  int _questionNum = 0;
  final _questions = const [
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'England', 'score': 0},
        {'text': 'USA', 'score': 1},
        {'text': 'Australia', 'score': 0},
        {'text': 'Canada', 'score': 0},
      ],
      'image': './images/flags/USA.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Syria', 'score': 0},
        {'text': 'Brazil', 'score': 0},
        {'text': 'Jordan', 'score': 0},
        {'text': 'Lebanon', 'score': 1},
      ],
      'image': './images/flags/Lebanon.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Brazil', 'score': 1},
        {'text': 'Argentina', 'score': 0},
        {'text': 'Columbia', 'score': 0},
        {'text': 'Spain', 'score': 0},
      ],
      'image': './images/flags/Brazil.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Columbia', 'score': 0},
        {'text': 'Palestine', 'score': 0},
        {'text': 'Ireland', 'score': 0},
        {'text': 'Cuba', 'score': 1},
      ],
      'image': './images/flags/Cuba.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Poland', 'score': 0},
        {'text': 'Finland', 'score': 0},
        {'text': 'Argentina', 'score': 1},
        {'text': 'England', 'score': 0},
      ],
      'image': './images/flags/Argentina.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Mexico', 'score': 0},
        {'text': 'Canada', 'score': 1},
        {'text': 'Germany', 'score': 0},
        {'text': 'Belgium', 'score': 0},
      ],
      'image': './images/flags/Canada.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Belgium', 'score': 0},
        {'text': 'Netherlands', 'score': 0},
        {'text': 'France', 'score': 1},
        {'text': 'Italy', 'score': 0},
      ],
      'image': './images/flags/France.png',
    },
  ];

  var _timeLeft = 108;

  void _answerQuestion() {
    if (_questionNum < _questions.length - 1) {
      _timeLeft = 108;
      setState(() {
        if (_questionNum == 0) _startCountDown();
        _questionNum++;
      });
    }
  }

  void _startCountDown() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        _timeLeft = 108;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[800],
      backgroundColor: _backgroundColor, // Outer Space Crayola
      body: Column(
        children: [
          Stack(
            // Circular Timer and Player Icon
            children: [
              CircularTimer(_timeLeft),
              Header(_playerColor, _opponentColor),
            ],
          ),
          Question(_questions[_questionNum]['question'] as String), // Question
          Row(
            // Answers between Timer Bars
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LinearTimer(_playerColor, _timeLeft).padding(left: 10),
              Answers(
                _questions[_questionNum]['answers']
                    as List<Map<String, Object>>,
                _questions[_questionNum]['image'] as String,
                _answerQuestion,
              ),
              LinearTimer(_opponentColor, 100).padding(right: 10),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Quiz()));
}
