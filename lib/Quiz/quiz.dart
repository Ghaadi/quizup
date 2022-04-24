import './playerData.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'FireBaseFetch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:async';

import '../End Screen/end.dart';
import './answers.dart';
import './question.dart';
import './linearTimer.dart';
import './header.dart';
import './circularTimer.dart';
import '../Categories/categories.dart';
import '../Transition/transition.dart';

class Quiz extends StatefulWidget {
  final int _questionNum, _score, _challengerScore;
  final String _category;
  final String username;

  const Quiz(this._category, this._questionNum, this.username, this._score,
      this._challengerScore);
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  late final String _categoryName;
  late Future _loader;
  late int _questionNum, _score, _challengerScore;
  List<Map<dynamic, dynamic>> questions1 = [{}];

  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    _categoryName = widget._category;
    _questionNum = widget._questionNum - 1;
    _score = widget._score;
    _challengerScore = widget._challengerScore;
    _loader = _fillList();
  }

  _fillList() async {
    var s = Player(_challengerScore, 'Salim');
    s.GetScore(_challengerScore, 'Rawad');
    QuestionFetch q = QuestionFetch(_categoryName, user.uid);
    List<Map<dynamic, dynamic>> questionReturn =
        await q.getData(q.category_name);

    questions1 = questionReturn;

    _challengerScore = s.getCount();
  }

  var s = Player(0, 'Salim');

  final Color _playerColor = Colors.red;
  final Color _opponentColor = Colors.blue;
  final Color _backgroundColor = const Color(0xFF2E3532);

  bool _countdownStarted = false;

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

  var _timeLeft = 106;

  void _answerQuestion(int points) {
    if (_questionNum < _questions.length - 2) {
      _timeLeft = 108;
      setState(() {
        //setOpponentScore();
        _score += points;
        // _questionNum++;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TransitionScreen(
            _categoryName,
            _questionNum + 2,
            _score,
            _challengerScore,
          ),
        ),
      );
    } else if (_questionNum == _questions.length - 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              EndScreen(_categoryName, (_score + points).toString()),
        ),
      );
    }
  }

  /* void setOpponentScore() {
    s.SendScore(_score, "Salim");
    s.GetOpponentScore(_score, challenGerScore, 'rawad');
    setState(() {
      challenGerScore = s.getCount();
    });
  }*/

  void _startCountDown() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timeLeft = 108;
        setState(() {
          _answerQuestion(0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loader,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text("Error");
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              // backgroundColor: Colors.grey[800],
              backgroundColor: _backgroundColor, // Outer Space Crayola
              body: Column(
                children: [
                  Stack(
                    // Circular Timer and Player Icon
                    children: [
                      CircularTimer(_timeLeft),
                      Header(_playerColor, _opponentColor, _score,
                          _challengerScore, widget.username),
                    ],
                  ),
                  Question(questions1[_questionNum]['question']
                      as String), // Question
                  Row(
                    // Answers between Timer Bars
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LinearTimer(_playerColor, _timeLeft).padding(left: 10),
                      Answers(
                        questions1[_questionNum]['answers']
                            as List<Map<String, dynamic>>,
                        questions1[_questionNum]['image'],
                        _answerQuestion,
                      ),
                      LinearTimer(_opponentColor, 100).padding(right: 10),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Text("Please reload app");
          }
        });
  }
}

/*void main() {
  runApp(
    MaterialApp(
      home: Quiz("Lebanon"),
    ),
  );
}*/
