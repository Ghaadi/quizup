import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Player {
  int _Score = 0;

  String username;

  Player(this._Score, this.username);

  int getCount() {
    return _Score;
  }

  void createGame(myName, opponent_name) {
    FirebaseDatabase.instance.reference().child("/Games").update({
      'games2': {
        'players': {
          '$myName': {'id': '101', 'total score': 0},
          '$opponent_name': {'id': '102', 'name': 'rawad', 'total score': 0}
        }
      }
    });
  }

  Future<int> GetScore(Score, name) async {
    final snapshot = await FirebaseDatabase.instance
        .reference()
        .child('/Games/games2/players/$name/total score')
        .get();
    final counter = snapshot.value as int;
    _Score = counter;
    Score = counter;
    return Score;
  }

  Future<void> SendScore(int a, name) async {
    FirebaseDatabase.instance
        .reference()
        .child("/Games/games2/players/$name")
        .update({'total score': a});
  }

  Future<void> GetOpponentScore(int a, Score, opponent_name) async {
    SendScore(a, "Salim");
    GetScore(Score, opponent_name);
  }
}
