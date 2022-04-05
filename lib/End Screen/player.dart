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
            color: Color(0xFFEDF4F5),
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
