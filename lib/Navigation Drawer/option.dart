import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final IconData _icon;
  final String _name;
  final Color _iconColor;
  final Function() _pushScreen;

  const Option(this._icon, this._name, this._iconColor, this._pushScreen);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 3.5 * MediaQuery.of(context).size.width / 5,
      height: 65,
      child: TextButton(
        onPressed: _pushScreen,
        style: TextButton.styleFrom(
          primary: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
          child: Row(
            children: [
              Icon(
                _icon,
                color: _iconColor,
                size: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  _name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
