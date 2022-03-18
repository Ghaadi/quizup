import 'package:flutter/material.dart';

import './display.dart';

class Categories extends StatelessWidget {
  final Color _backgroundColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Colors.black,
      ),
      endDrawer: Drawer(),
      body: Column(children: [
        Display(Icons.badge, "Logo", Colors.black),
        Display(Icons.flag_rounded, "Flags", Colors.black),
        Display(Icons.sports_basketball_outlined, "Sports", Colors.black),
        Display(Icons.code, "Computer Science", Colors.black),
        Display(Icons.temple_hindu_sharp, "History", Colors.black),
        Display(Icons.biotech_outlined, "Biology", Colors.black),
        Display(Icons.computer, "Tech", Colors.black),
      ]),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Categories(),
    ),
  );
}
