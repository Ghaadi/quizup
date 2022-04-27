// ignore_for_file: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: HomeScreen()),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
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
                    const SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          "Play",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
