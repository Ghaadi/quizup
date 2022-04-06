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
      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4.57,
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
                width: MediaQuery.of(context).size.width / 4.57,
                height: MediaQuery.of(context).size.height / 13.67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: _color,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.84,
                height: MediaQuery.of(context).size.height / 15.19,
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
