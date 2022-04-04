import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import '../Navigation Drawer/drawer.dart';
import './player.dart';
import './points.dart';

class EndScreen extends StatelessWidget {
  final Color _backgroundColor = const Color(0xFF2E3532);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Flags",
        ),
      ),
      endDrawer: const NavDrawer("Salim"),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 30),
            child: const Text(
              "You Win!",
              style: TextStyle(fontSize: 50, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Player("Salim", Icons.account_circle),
              Player("Rawad", Icons.account_circle),
            ],
          ),
          Row(
            children: const [
              Points("Bonus"),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: EndScreen(),
    ),
  );
}
