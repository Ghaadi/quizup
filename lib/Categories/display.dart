import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String _display;
  final Color _answerColor = const Color(0xFFEDF4F5);

  const Display(this._display);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 60,
      margin: const EdgeInsets.fromLTRB(10, 20, 0, 5),
      child: ElevatedButton(
        onPressed: (null),
        child: Text(
          _display,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: _answerColor,
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
