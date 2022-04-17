import 'package:flutter/material.dart';
import 'dart:async';

import '../Categories/categories.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3), () => print("Ghady loute"));
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushNamed(
        context,
        '/categories',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.offline_bolt,
                      color: Colors.redAccent,
                      size: 150,
                    ),
                    Text(
                      "QuizUp",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(home: SplashScreen()),
//   );
// }
