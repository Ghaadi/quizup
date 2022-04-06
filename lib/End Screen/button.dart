import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _label;
  final Color _color = const Color(0xFFEDF4F5);

  const Button(this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width / 2.2,
      margin: const EdgeInsets.fromLTRB(0, 65, 0, 0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          _label,
          style: const TextStyle(
            color: Color(0xFF212529),
            // color: Colors.yellow[900],
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(_color),
        ),
      ),
    );
  }
}
