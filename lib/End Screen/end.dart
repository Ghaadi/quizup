import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import '../Navigation Drawer/drawer.dart';

import './player.dart';
import './points.dart';
import './button.dart';
import '../Categories/categories.dart';
import '../Quiz/quiz.dart';

class EndScreen extends StatelessWidget {
  // final Color _backgroundColor = const Color(0xFF2E3532);
  final Color _backgroundColor = const Color(0xFF212529);
  final String _username = "Salim";
  final String _score;

  const EndScreen(this._score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
        toolbarHeight: 60,
        title: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: const Text(
            "Flags",
            style: TextStyle(fontSize: 26),
          ),
        ),
        iconTheme: const IconThemeData(
          size: 35,
          color: Color(0xFFEDF4F5),
        ),
      ),
      endDrawer: NavDrawer(_username),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 30),
            child: const Text(
              "You Win!",
              style: TextStyle(fontSize: 50, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Player(_username, Icons.account_circle),
              const Player("Rawad", Icons.account_circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Points("Match Score", Colors.blue, _backgroundColor, _score),
              Points("Victory Bonus", Colors.green, _backgroundColor, "40"),
              Points("Total\nXP", Colors.purple, _backgroundColor, "126"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                "Rematch",
                () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Quiz("Flags"),
                  ),
                ),
              ),
              Button(
                "Play Another",
                () => Navigator.popUntil(
                  context,
                  ModalRoute.withName('/categories'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
