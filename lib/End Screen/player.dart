import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String _username;
  final IconData icon;

  const Player(this._username, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.account_circle,
          size: 110,
        ),
        Text(
          _username,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
