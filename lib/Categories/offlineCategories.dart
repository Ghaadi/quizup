import 'package:flutter/material.dart';

import './display.dart';
import '../Navigation Drawer/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Quiz/FireBaseFetch.dart';

class OfflineCategories extends StatelessWidget {
  final String username;
  final Color _backgroundColor = Colors.green;

  final user = FirebaseAuth.instance.currentUser!;
  OfflineCategories(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: const Text(
            "All Topics",
            style: TextStyle(fontSize: 23),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          size: 35,
          color: Color(0xFFEDF4F5),
        ),
      ),
      // endDrawer: const Drawer(),
      endDrawer: NavDrawer(username),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Display(Icons.apple, "Health", Colors.black, username),
              ),
              Display(Icons.flag_rounded, "Lebanon", Colors.black, username),
              Display(Icons.sports_basketball_outlined, "Sports", Colors.black,
                  username),
              Display(Icons.code, "Computer Science", Colors.black, username),
              Display(Icons.book_outlined, "History", Colors.black, username),
              Display(
                  Icons.biotech_outlined, "Aub info", Colors.black, username),
              Display(Icons.computer, "Computers", Colors.black, username),
              Display(Icons.map_outlined, "General knowledge", Colors.black,
                  username),
              Display(Icons.numbers, "Math", Colors.black, username)
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Categories(),
//     ),
//   );
// }

