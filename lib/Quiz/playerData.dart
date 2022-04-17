import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Player {
  int _Score = 0;

  Player(id) {
    _Score = id;
  }

  int getCount() {
    return _Score;
  }

  void createGame() {
    FirebaseDatabase.instance.reference().child("/Games/game1").update({
      'gameId': '20202',
      'players': {
        'player1': {'id': '101', 'name': 'rawad', 'total score': 0},
        'player2': {'id': '102', 'name': 'rawad', 'total score': 0}
      }
    });
  }

  Future<int> GetScore() async {
    final snapshot = await FirebaseDatabase.instance
        .reference()
        .child('Games/game1/players/player1/answer counter')
        .get();
    final counter = snapshot.value as int;
    _Score = counter;
    return counter;
  }

  void SendScore(int a) {
    FirebaseDatabase.instance.reference().child("/Games/game1").update({
      'players': {
        'player1': {'answer counter': a}
      }
    });
  }
}
