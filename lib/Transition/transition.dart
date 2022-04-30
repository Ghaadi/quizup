import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../Quiz/quiz.dart';

class TransitionScreen extends StatelessWidget {
  final int _questionNum, _score, _challengerScore;
  final String _category;
  final String _username;

  const TransitionScreen(
    this._category,
    this._questionNum,
    this._score,
    this._challengerScore,
    this._username,
  );

  void answerStatusReset() async {
    FirebaseFirestore.instance
        .collection("gameRoom")
        .doc("player1")
        .update({"questionAnswered": false});

    FirebaseFirestore.instance
        .collection("gameRoom")
        .doc("player2")
        .update({"questionAnswered": false});
  }

  @override
  Widget build(BuildContext context) {
    answerStatusReset();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Quiz(
            _category,
            _questionNum,
            _username,
            _score,
            _challengerScore,
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF2E3532),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                          FadeAnimatedText(_category,
                              duration: const Duration(seconds: 1),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.4),
                        ]),
                        AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                          FadeAnimatedText('Round $_questionNum',
                              duration: const Duration(seconds: 1),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.4),
                        ]),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
