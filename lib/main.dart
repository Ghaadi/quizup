import 'package:flutter/material.dart';
import 'package:quizup_prototype/Quiz/quiz.dart';
import 'package:quizup_prototype/Splash_Screen/screen.dart';

import './Categories/categories.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _selectedCategory = "";
  bool _isRematch = false;
  bool _didQuit = false;

  // void _selectCategory(String categoryName) {
  //   _selectedCategory = categoryName;
  //   Navigator.pushNamed(
  //     context,
  //     '/quiz',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/categories': (context) => Categories(),
        // '/quiz': (context) => Quiz(_selectedCategory),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
