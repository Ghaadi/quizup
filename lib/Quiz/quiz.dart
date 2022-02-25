import 'package:flutter/material.dart';
import 'dart:math' as math;

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
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
                      children: const [
                        Padding(
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
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(
                            '${0}',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const Opacity(
                      opacity: 0.5,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 8,
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: const CircularProgressIndicator(
                        value: 0.6,
                        strokeWidth: 8,
                      ),
                    ),
                    const Center(
                      child: Text(
                        '${6}',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                child: Row(
                  children: [
                    Stack(
                      children: const [
                        Padding(
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
                          padding: EdgeInsets.fromLTRB(46, 30, 0, 0),
                          child: Text(
                            '${0}',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.blue,
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
              Stack(
                children: [
                  SizedBox(
                      width: 100,
                      height: 5,
                      child: Transform.rotate(
                        angle: -math.pi / 2,
                        child: const LinearProgressIndicator(
                          value: 0.6,
                        ),
                      ),
                    ),
                  Image.asset(
                    "./imgs/usa.png",
                    scale: 0.38,
                  ),
                ],
              ),
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
