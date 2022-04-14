import 'package:flutter/material.dart';

import '../Quiz/quiz.dart';

class Display extends StatelessWidget {
  final IconData _icon;
  final String _categoryName;
  final Color _iconColor;
  // final Function(String) _selectCategory;

  const Display(
    this._icon,
    this._categoryName,
    this._iconColor,
    // this._selectCategory,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.11,
      height: MediaQuery.of(context).size.height / 11.39,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const Quiz("Flags"),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                _icon,
                color: _iconColor,
                size: 40,
              ),
            ),
            Text(
              _categoryName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFE5E5E0),
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
