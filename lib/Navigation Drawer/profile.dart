import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String _username;
  final String _title;

  const Profile(this._username, this._title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.grey,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 70,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 7, 0, 0),
                child: Text(
                  _username,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 33, 0, 4),
                child: Text(
                  _title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
