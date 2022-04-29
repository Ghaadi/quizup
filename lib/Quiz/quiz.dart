import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import './playerData.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/foundation.dart';
import 'FireBaseFetch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:async';
import '../Chat/chat_screen.dart';
import '../End Screen/end.dart';
import './answers.dart';
import './question.dart';
import './linearTimer.dart';
import './header.dart';
import './circularTimer.dart';
import '../Categories/categories.dart';
import '../Transition/transition.dart';
import 'package:firebase_database/firebase_database.dart';

class Quiz extends StatefulWidget {
  final int _questionNum, _score, _challengerScore;
  final String _category;
  final String username;

  Quiz(this._category, this._questionNum, this.username, this._score,
      this._challengerScore);

  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  late final String _categoryName;
  late Future _loader;
  late int _questionNum, _score, _challengerScore;
  List<Map<dynamic, dynamic>> questions1 = [{}];

  /*Future<bool> getopponentStatus() async {
    final snapshot = await FirebaseDatabase.instance
        .reference()
        .child('/Games/games2/players/opponentJoined')
        .get();

    final opponentStatus = snapshot.value as bool;

    opponentJoined = opponentStatus;

    return opponentJoined;
  }*/

  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    _categoryName = widget._category;
    _questionNum = widget._questionNum - 1;
    _score = widget._score;
    _challengerScore = widget._challengerScore;
    _loader = _fillList();
    _startCountDown();
    _opponentStartCountDown();
  }

  _fillList() async {
    // var s = Player(_challengerScore, 'Salim');
    //Rs.GetScore(_challengerScore, "name");
    // s.SendScore(_score, "Salim");
    QuestionFetch q = QuestionFetch(_categoryName, user.uid);
    List<Map<dynamic, dynamic>> questionReturn =
        await q.getData(q.category_name);

    questions1 = questionReturn;
  }

  var s = Player(0, 'Salim');

  final db = FirebaseFirestore.instance;

  final Color _playerColor = Colors.red;
  final Color _opponentColor = Colors.blue;
  final Color _backgroundColor = const Color(0xFF2E3532);

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
  var _opponentTimeLeft = 106;

  void _answerQuestion(int points) {
    _hasAnswered = true;
    questionStatuschange();
    if (_questionNum < _questions.length - 2) {
      setState(() {
        _score += points;
      });
      var s = Player(_challengerScore, 'Salim');
      s.SendScore(_score, "Salim");
    } else if (_questionNum == _questions.length - 2) {
      _score += points;
      var s = Player(_challengerScore, 'Salim');
      s.SendScore(_score, "Salim");
    }
  }

  void waitingRoomReset() async {
    FirebaseFirestore.instance
        .collection("opponentStatus")
        .doc("opponent1")
        .update({"playerjoined": false});

    FirebaseFirestore.instance
        .collection("opponentStatus")
        .doc("opponent2")
        .update({"playerjoined": false});
  }

  void questionStatuschange() async {
    FirebaseFirestore.instance
        .collection("gameRoom")
        .doc("player1")
        .update({"questionAnswered": true});
  }

  /* void setOpponentScore() {
    s.SendScore(_score, "Salim");
    s.GetOpponentScore(_score, challenGerScore, 'rawad');
    setState(() {
      challenGerScore = s.getCount();
    });
  }*/

  bool _hasAnswered = false;
  bool _opponentHasAnswered = false;

  void _startCountDown() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_hasAnswered) {
        if (_timeLeft > 0) {
          setState(() {
            _timeLeft--;
          });
        } else {
          // _timeLeft = 108;
          setState(() {
            _answerQuestion(0);
          });
        }
      }
    });
  }

  void _opponentStartCountDown() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_opponentHasAnswered) {
        if (_timeLeft > 0) {
          setState(() {
            _opponentTimeLeft--;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    db
        .collection("gameRoom")
        .where("SlODkfYRO7rTcemoz0im")
        .snapshots()
        .listen((event) {
      final opponentScore1 = [];
      for (var doc in event.docs) {
        opponentScore1.add(doc.data()["Salim"]);
      }
      _challengerScore = opponentScore1[0];
    });

    db
        .collection("gameRoom")
        .where("questionAnswered")
        .snapshots()
        .listen((event) {
      final questionsAnswered = [];
      for (var doc in event.docs) {
        questionsAnswered.add(doc.data()["questionAnswered"]);
      }
      print(questionsAnswered);
      print(_score);
      // print(opponentScore1);

      _hasAnswered = questionsAnswered[2];
      _opponentHasAnswered = questionsAnswered[1];

      if (questionsAnswered[1] == true && questionsAnswered[2] == true) {
        if (_questionNum < _questions.length - 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TransitionScreen(
                _categoryName,
                _questionNum + 2,
                _score,
                _challengerScore,
                widget.username,
              ),
            ),
          );
        } else if (_questionNum == _questions.length - 2) {
          waitingRoomReset();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => EndScreen(
                      _score.toString(),
                      widget.username,
                      widget._category,
                      _challengerScore.toString(),
                    )
                // ChatScreen(_score.toString(), widget.username, widget._category,
                //     _score, _challengerScore),
                ),
          );
        }
      }
    });
    return FutureBuilder(
        future: _loader,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Color(0xFF2E3532),
            );
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
                      Header(
                        _playerColor,
                        _opponentColor,
                        _score,
                        _challengerScore,
                        widget.username,
                      ),
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
                      LinearTimer(_opponentColor, _opponentTimeLeft).padding(right: 10),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Text("reload app");
          }
        });
  }
}
