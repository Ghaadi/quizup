import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  final String _name;
  final String _points;
  final Color _color;
  final Color _secondColor;

  const Points(this._name, this._color, this._secondColor, this._points);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(
        children: [
          Container(
            width: 90,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: Text(
              _name,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFFEDF4F5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: _color,
                ),
              ),
              Container(
                width: 85,
                height: 45,
                margin: const EdgeInsets.fromLTRB(2.5, 2.5, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: _secondColor,
                ),
                child: Center(
                  child: Text(
                    _points,
                    style: TextStyle(
                      fontSize: 20,
                      color: _color,
                    ),
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
