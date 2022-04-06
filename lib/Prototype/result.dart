import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore1;
  final int resultScore2;
  final VoidCallback resetHandler;
  final VoidCallback endHandler;

  const Result(
    this.resultScore1,
    this.resultScore2,
    this.resetHandler,
    this.endHandler,
  );

  String get resultPhrase {
    var resultText = 'Player 1';

    if (resultScore1 > resultScore2) {
      resultText = 'Player 1 Won!';
    } else if (resultScore1 < resultScore2) {
      resultText = 'Player 2 Won!';
    } else {
      resultText = "Tie!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.blue,
              // backgroundColor: Colors.blue[100],
            ),
          ),
          TextButton(
            onPressed: resetHandler,
            child: const Text(
              'Restart Challenge',
              style: TextStyle(fontSize: 20),
            ),
            style: TextButton.styleFrom(primary: Colors.green[600]),
          ),
          TextButton(
            onPressed: endHandler,
            child: const Text(
              'End Game',
              style: TextStyle(fontSize: 20),
            ),
            style: TextButton.styleFrom(
              primary: Colors.red[600],
            ),
          ),
        ],
      ),
    );
  }
}
