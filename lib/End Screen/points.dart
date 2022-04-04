import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  final String _name;

  const Points(this._name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_name),
        Container(
          child: const Icon(
            Icons.crop_square_rounded,
            
          ),
        ),
      ],
    );
  }
}
