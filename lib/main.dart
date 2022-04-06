import 'package:flutter/material.dart';
import 'package:quizup_prototype/Quiz/quiz.dart';

import './Categories/categories.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: Categories(
              didSelectCategory: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          ),
          if (_selectedCategory != "")
            MaterialPage(child: Quiz(_selectedCategory)),
        ],
        onPopPage: (route, result) {
          _selectedCategory = "";
          return route.didPop(result);
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
