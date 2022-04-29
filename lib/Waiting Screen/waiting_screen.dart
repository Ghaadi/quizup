import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: WaitingScreen(),
//     ),
//   );
// }

class WaitingScreen extends StatelessWidget {
  final String _category;
  final String _username;

  const WaitingScreen(this._category, this._username, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3532),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: const Text(
                    "Waiting for opponent",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 80, 0, 0),
                  child: LoadingAnimationWidget.newtonCradle(
                    color: Colors.white,
                    size: 200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
