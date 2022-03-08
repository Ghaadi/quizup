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
        {'text': 'England', 'score': 0},
        {'text': 'USA', 'score': 1},
        {'text': 'Australia', 'score': 0},
        {'text': 'Canada', 'score': 0},
      ],
      'picture': './imgs/Flags/USA.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Syria', 'score': 0},
        {'text': 'Brazil', 'score': 0},
        {'text': 'Jordan', 'score': 0},
        {'text': 'Lebanon', 'score': 1},
      ],
      'picture': './imgs/Flags/Lebanon.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Brazil', 'score': 1},
        {'text': 'Argentina', 'score': 0},
        {'text': 'Columbia', 'score': 0},
        {'text': 'Spain', 'score': 0},
      ],
      'picture': './imgs/Flags/Brazil.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Columbia', 'score': 0},
        {'text': 'Palestine', 'score': 0},
        {'text': 'Ireland', 'score': 0},
        {'text': 'Cuba', 'score': 1},
      ],
      'picture': './imgs/Flags/Cuba.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Poland', 'score': 0},
        {'text': 'Finland', 'score': 0},
        {'text': 'Argentina', 'score': 1},
        {'text': 'England', 'score': 0},
      ],
      'picture': './imgs/Flags/Argentina.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Mexico', 'score': 0},
        {'text': 'Canada', 'score': 1},
        {'text': 'Germany', 'score': 0},
        {'text': 'Belgium', 'score': 0},
      ],
      'picture': './imgs/Flags/Canada.png',
    },
    {
      'questionText': 'What country does this flag represent?',
      'answers': [
        {'text': 'Belgium', 'score': 0},
        {'text': 'Netherlands', 'score': 0},
        {'text': 'France', 'score': 1},
        {'text': 'Italy', 'score': 0},
      ],
      'picture': './France.png',
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
