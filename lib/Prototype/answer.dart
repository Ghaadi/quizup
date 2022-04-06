import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback yass;

  final String answerText;
  Answer(this.yass, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            onPrimary: Colors.white,
          ),
          child: Text(answerText),
          onPressed: yass,
        ));
  }
}
