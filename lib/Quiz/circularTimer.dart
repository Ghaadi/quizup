import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularTimer extends StatelessWidget {
  final Color _timerColor;

  const CircularTimer(this._timerColor);

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
                strokeWidth: 8,
                color: _timerColor,
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CircularProgressIndicator(
                value: 0.6,
                strokeWidth: 8,
                color: _timerColor,
              ),
            ),
            Center(
              child: Text(
                '${6}',
                style: TextStyle(
                    color: _timerColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
