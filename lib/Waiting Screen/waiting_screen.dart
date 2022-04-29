import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Transition/transition.dart';

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
    final db = FirebaseFirestore.instance;
    db
        .collection("opponentStatus")
        .where("playerjoined")
        .snapshots()
        .listen((event) {
      final cities = [];
      for (var doc in event.docs) {
        cities.add(doc.data()["playerjoined"]);
      }
      print(cities);
      final player1status = cities[0];
      final player2status = cities[0];

      if ((player1status == true) && (player2status == true)) {
        /*Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    TransitionScreen(_category, 1, 0, 0, _username)));*/
      }
    });
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
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 25),))
          ],
        ),
      ),
    );
  }
}
