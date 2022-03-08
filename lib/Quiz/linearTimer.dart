import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class LinearTimer extends StatelessWidget {
  final Color _playerColor;
  final int _timeLeft;

  const LinearTimer(this._playerColor, this._timeLeft);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 400,
      child: FAProgressBar(
        currentValue: _timeLeft,
        progressColor: _playerColor,
        direction: Axis.vertical,
        verticalDirection: VerticalDirection.up,
      ),
    );
  }
}
