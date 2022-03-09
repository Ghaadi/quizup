import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Color _playerColor;
  final Color _opponentColor;
  final int _score;

  const Header(this._playerColor, this._opponentColor, this._score);

  @override
  Widget build(BuildContext context) {
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Salim",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      '$_score',
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
                    padding: const EdgeInsets.fromLTRB(46, 30, 0, 0),
                    child: Text(
                      '${0}',
                      style: TextStyle(
                        fontSize: 26,
                        color: _opponentColor,
                      ),
                    ),
                  ),
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
}
