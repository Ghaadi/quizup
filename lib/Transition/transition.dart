import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TransitionScreen extends StatelessWidget {
  final int _questionNum;

  const TransitionScreen(this._questionNum);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3532),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                          FadeAnimatedText('Flags',
                              duration: const Duration(seconds: 5),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.4),
                        ]),
                        AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                          FadeAnimatedText('Round $_questionNum',
                              duration: const Duration(seconds: 5),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.4),
                        ]),
                        AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                          FadeAnimatedText('Get Ready',
                              duration: const Duration(seconds: 5),
                              fadeOutBegin: 0.9,
                              fadeInEnd: 0.4),
                        ])
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(home: TransitionScreen(), debugShowCheckedModeBanner: false,),
  );
}
