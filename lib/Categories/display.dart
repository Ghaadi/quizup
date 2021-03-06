import 'package:flutter/material.dart';
import '../Waiting Screen/waiting_screen.dart';
import '../Transition/transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Quiz/quiz.dart';

class Display extends StatelessWidget {
  final IconData _icon;
  final String _categoryName;
  final Color _iconColor;
  final String username;

  // final Function(String) _selectCategory;

  Display(
    this._icon,
    this._categoryName,
    this._iconColor,
    this.username,

    // this._selectCategory,
  );

  void updatePlayerStatus() async {
    FirebaseFirestore.instance
        .collection("opponentStatus")
        .doc("opponent2")
        .update({"playerjoined": true});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.07,
      height: MediaQuery.of(context).size.height / 11.39,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: ElevatedButton(
        onPressed: () {

          updatePlayerStatus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  // TransitionScreen(_categoryName, 1, 0, 0, username),

                  WaitingScreen(_categoryName, username),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                _icon,
                color: _iconColor,
                size: 40,
              ),
            ),
            Text(
              _categoryName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFE5E5E0),
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
