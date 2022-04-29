import 'package:flutter/material.dart';
import 'dart:async';

import '../Categories/categories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushNamed(context, '/signIn');
      } else {
        Navigator.pushNamed(context, '/homeScreen');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), isLoggedIn);
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
