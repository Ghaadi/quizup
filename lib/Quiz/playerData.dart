import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Player {
  int score;
  String username;

  Player(this.score, this.username);
  final user = FirebaseAuth.instance.currentUser!;
  int _Score = 0;
  late String email;

  int getCount() {
    return score;
  }

  void createGame(myName) {
    FirebaseFirestore.instance
        .collection("gameRoom")
        .add({"Salim": 0, "gameDone": false});
  }

  void findGame(myName) async {}

  Future<int> GetScore(score1, name) async {
    final db = FirebaseFirestore.instance;
    int score = await db.collection("gameRoom").where("Rawad").get() as int;

    score1 = score;
    return score;
  }

  Future<void> SendScore(int score, name) async {
    FirebaseFirestore.instance
        .collection("gameRoom")
        .doc("SlODkfYRO7rTcemoz0im")
        .update({"Rawad": score});
  }

  Future<void> GetOpponentScore(int a, Score, opponent_name) async {
    //SendScore(a, "Salim");
    GetScore(Score, opponent_name);
  }
}
