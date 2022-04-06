import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final IconData _icon;
  final String _name;
  final Color _iconColor;
  final ValueChanged _didSelectCategory;

  const Display(
      this._icon, this._name, this._iconColor, this._didSelectCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.11,
      height: MediaQuery.of(context).size.height / 11.39,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: ElevatedButton(
        onPressed: () => _didSelectCategory(_name),
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
              _name,
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
