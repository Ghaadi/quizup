import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularTimer extends StatelessWidget {
  final Color _timerColor = const Color(0xFF28A745);
  final int _timeLeft;

  const CircularTimer(this._timeLeft);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.3,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 12,
                color: _timerColor,
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CircularProgressIndicator(
                value: _timeLeft / 100,
                strokeWidth: 12,
                color: _timerColor,
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    // color: Colors.grey[400],
                    color: Color(0xFFD6CFCB),
                    shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Text(
                // '${(_timeLeft > 100) ? 10 : _timeLeft~/10}',
                '${_timeLeft~/10}',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
