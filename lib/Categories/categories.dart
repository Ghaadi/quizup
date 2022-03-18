import 'package:flutter/material.dart';

import './display.dart';

int _displaynum = 0;
final _display = const ['Logos', 'Flags', 'Computer science'];

class Categories extends StatelessWidget {
  final Color _backgroundColor = Color;
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
        Display(_display[0]),
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
