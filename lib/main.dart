import 'package:flutter/material.dart';
import 'package:quizup_prototype/Quiz/quiz.dart';
import 'package:flutter/foundation.dart';

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
          if (_selectedCategory == "Flags") MaterialPage(child: Quiz()),
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
  if(kDebugMode){ // is Release Mode ??
    print('release mode');
  } else {
    print('debug mode');
  }
  runApp(MyApp());
}
