import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Timer extends StatelessWidget {
  final Color _playerColor;

  const Timer(this._playerColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 400,
      child: FAProgressBar(
        currentValue: 100,
        progressColor: _playerColor,
        direction: Axis.vertical,
      ),
    );
  }
}
