import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:math' as math;

import './answers.dart';
import './question.dart';
import './linearTimer.dart';
import './header.dart';
import './circularTimer.dart';

class Quiz extends StatelessWidget {
  final Color _timerColor = const Color(0xFF28A745);
  final Color _playerColor = Colors.red;
  final Color _opponentColor = Colors.blue;
  final Color _backgroundColor = const Color(0xFF2E3532);
  int questionNum = 0;
  final questions = const [
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Lebanon', 'score': 1},
        {'text': 'USA', 'score': 0},
        {'text': 'Australia', 'score': 0},
        {'text': 'Canada', 'score': 0},
      ],
      'picture': './imgs/usa.png',
    },
    {
      'questionText': 'Who created Microsoft',
      'answers': [
        {'text': 'Bill Gates', 'score': 1},
        {'text': 'Donald Trump', 'score': 0},
        {'text': 'Steve Jobs', 'score': 0},
      ],
    },
    {
      'questionText': 'Where is Beirut ',
      'answers': [
        {'text': 'Brazil', 'score': 0},
        {'text': 'Emirates', 'score': 0},
        {'text': 'Lebanon', 'score': 1},
      ],
    },
    {
      'questionText': 'Who is the president of America',
      'answers': [
        {'text': 'clint eastwood', 'score': 0},
        {'text': 'tom hanks', 'score': 0},
        {'text': 'joe biden', 'score': 1},
      ],
    },
    {
      'questionText': 'Who created Microsoft',
      'answers': [
        {'text': 'Bill Gates', 'score': 1},
        {'text': 'Donald Trump', 'score': 0},
        {'text': 'Steve Jobs', 'score': 0},
      ],
    },
    {
      'questionText': 'Where is Beirut ',
      'answers': [
        {'text': 'Brazil', 'score': 0},
        {'text': 'Emirates', 'score': 0},
        {'text': 'Lebanon', 'score': 1},
      ],
    },
  ];

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
              CircularTimer(_timerColor),
              Header(_playerColor, _opponentColor),
            ],
          ),
          Question(), // Question
          Row(
            // Answers between Timer Bars
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Timer(_playerColor).padding(left: 10),
              Answers(),
              Timer(_opponentColor).padding(right: 10),
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
