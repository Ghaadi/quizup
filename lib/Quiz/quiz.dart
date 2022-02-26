import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:math' as math;

class Quiz extends StatelessWidget {
  final Color _timerColor = Colors.greenAccent[400] as Color;
  final Color _playerColor = Colors.red;
  final Color _opponentColor = Colors.blue;
  final Color _answerColor = const Color(0xFFD6CFCB); // Timberwolf

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[800],
      backgroundColor: const Color(0xFF2E3532), // Outer Space Crayola
      body: Column(
        children: [
          Stack(
            children: [
              Center(
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
                              color: _timerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                "Salim",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Text(
                                '${0}',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: _playerColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                "Rawad",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(46, 30, 0, 0),
                              child: Text(
                                '${0}',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: _opponentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 2 * MediaQuery.of(context).size.width / 3,
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 50),
            child: const Text(
              "What country does this flag represent?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 15,
                height: 400,
                child: FAProgressBar(
                  currentValue: 100,
                  progressColor: _playerColor,
                  direction: Axis.vertical,
                ),
              ).padding(left: 10),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                    child: Image.asset(
                      "./imgs/usa.png",
                      scale: 0.36,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        margin: const EdgeInsets.fromLTRB(0, 10, 12, 10),
                        child: ElevatedButton(
                          onPressed: () => print("clicked!"),
                          child: const Text(
                            "Lebanon",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _answerColor,
                            onPrimary: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 90,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: ElevatedButton(
                          onPressed: () => print("clicked!"),
                          child: const Text(
                            "USA",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _answerColor,
                            onPrimary: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        margin: const EdgeInsets.fromLTRB(0, 0, 12, 10),
                        child: ElevatedButton(
                          onPressed: () => print("clicked!"),
                          child: const Text(
                            "Australia",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _answerColor,
                            onPrimary: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 90,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          onPressed: () => print("clicked!"),
                          child: const Text(
                            "Canada",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: _answerColor,
                            onPrimary: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 15,
                height: 400,
                child: FAProgressBar(
                  currentValue: 100,
                  progressColor: _opponentColor,
                  direction: Axis.vertical,
                  verticalDirection: VerticalDirection.up,
                ),
              ).padding(right: 10),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Quiz()));
}
