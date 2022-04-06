import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class LinearTimer extends StatelessWidget {
  final Color _playerColor;
  final int _timeLeft;

  const LinearTimer(this._playerColor, this._timeLeft);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 27.43,
      height: MediaQuery.of(context).size.height / 1.71,
      child: FAProgressBar(
        currentValue: _timeLeft,
        progressColor: _playerColor,
        direction: Axis.vertical,
        verticalDirection: VerticalDirection.up,
      ),
    );
  }
}
