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
        {'text': 'England', 'points': 0},
        {'text': 'USA', 'points': 1},
        {'text': 'Australia', 'points': 0},
        {'text': 'Canada', 'points': 0},
      ],
      'image': './images/flags/USA.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Syria', 'points': 0},
        {'text': 'Brazil', 'points': 0},
        {'text': 'Jordan', 'points': 0},
        {'text': 'Lebanon', 'points': 1},
      ],
      'image': './images/flags/Lebanon.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Brazil', 'points': 1},
        {'text': 'Argentina', 'points': 0},
        {'text': 'Columbia', 'points': 0},
        {'text': 'Spain', 'points': 0},
      ],
      'image': './images/flags/Brazil.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Columbia', 'points': 0},
        {'text': 'Palestine', 'points': 0},
        {'text': 'Ireland', 'points': 0},
        {'text': 'Cuba', 'points': 1},
      ],
      'image': './images/flags/Cuba.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Poland', 'points': 0},
        {'text': 'Finland', 'points': 0},
        {'text': 'Argentina', 'points': 1},
        {'text': 'England', 'points': 0},
      ],
      'image': './images/flags/Argentina.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Mexico', 'points': 0},
        {'text': 'Canada', 'points': 1},
        {'text': 'Germany', 'points': 0},
        {'text': 'Belgium', 'points': 0},
      ],
      'image': './images/flags/Canada.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Belgium', 'points': 0},
        {'text': 'Netherlands', 'points': 0},
        {'text': 'France', 'points': 1},
        {'text': 'Italy', 'points': 0},
      ],
      'image': './images/flags/France.png',
    },
    {
      'question': 'What country does this flag represent?',
      'answers': [
        {'text': 'Belgium', 'points': 0},
        {'text': 'Netherlands', 'points': 0},
        {'text': 'France', 'points': 1},
        {'text': 'Italy', 'points': 0},
      ],
    },
  ];

  var _timeLeft = 108;
  var _score = 0;

  void _answerQuestion(int points) {
    if (_questionNum < _questions.length - 1) {
      _timeLeft = 108;
      setState(() {
        if (_questionNum == 0) {
          _startCountDown();
        }
        _score += points;
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
              Header(_playerColor, _opponentColor, _score),
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
                _questions[_questionNum]['image'],
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
