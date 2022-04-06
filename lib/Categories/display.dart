import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final IconData _icon;
  final String _name;
  final Color _iconColor;

  const Display(this._icon, this._name, this._iconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 60,
      margin: const EdgeInsets.fromLTRB(10, 20, 0, 5),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(children: [
          Icon(
            _icon,
            color: _iconColor,
            size: 40,
          ),
          Text(
            _name,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
