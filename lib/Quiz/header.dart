import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Header extends StatelessWidget {
  final Color _playerColor;
  final Color _opponentColor;
  final int _score1;
  var _score2;

  final String username;

  /*final dbRef = FirebaseDatabase.instance
      .reference()
      .child('/Games/games2/players/Rawad/total score');*/

  final Stream<QuerySnapshot> OpponentScore =
      FirebaseFirestore.instance.collection("gameRoom").snapshots();

  /*void getScore() async {
    final dbRef1 = await FirebaseDatabase.instance
        .reference()
        .child('/Games/games2/players/Rawad/total score')
        .get();

    final score = dbRef1.value as int;

    _score2 = score;
  }*/

  Header(this._playerColor, this._opponentColor, this._score1, this._score2,
      this.username);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: OpponentScore,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            final data = snapshot.data!.docs;

            for (var element in data) {
              final opponentScore = element["Salim"];
              final messageSender = element['Salim'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                username,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Text(
                                '$_score1',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: _playerColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                "Rawad",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(46, 30, 0, 0),
                                child: Text("$opponentScore",
                                    style: TextStyle(
                                        fontSize: 26, color: _opponentColor)))
                          ],
                        ),
                        const Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          } else {
            return Text('retry');
          }
          return const Text("error");
        });
  }
}
