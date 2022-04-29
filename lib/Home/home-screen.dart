// ignore_for_file: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9CDE2),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "QuizUp",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.offline_bolt,
                      color: Colors.redAccent,
                      size: 100,
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/categories',
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFFF5252)),
                        ),
                        child: const Text(
                          "Play",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          iconSize: 55,
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                          iconSize: 55,
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.format_list_numbered_rtl_sharp,
                            color: Colors.black,
                          ),
                          iconSize: 55,
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.location_history_rounded,
                            color: Colors.black,
                          ),
                          iconSize: 55,
                        ),
                      ],
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
