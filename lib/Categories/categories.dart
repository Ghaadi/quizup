import 'package:flutter/material.dart';

import './display.dart';
import '../Navigation Drawer/drawer.dart';

class Categories extends StatelessWidget {
  final Color _backgroundColor = Colors.green;
  final ValueChanged didSelectCategory;

  const Categories({required this.didSelectCategory});

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
      endDrawer: const NavDrawer("Salim"),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Display(
                    Icons.badge, "Logo", Colors.black, didSelectCategory),
              ),
              Display(
                  Icons.flag_rounded, "Flags", Colors.black, didSelectCategory),
              Display(Icons.sports_basketball_outlined, "Sports", Colors.black,
                  didSelectCategory),
              Display(Icons.code, "Computer Science", Colors.black,
                  didSelectCategory),
              Display(Icons.book_outlined, "History", Colors.black,
                  didSelectCategory),
              Display(Icons.biotech_outlined, "Biology", Colors.black,
                  didSelectCategory),
              Display(Icons.computer, "Tech", Colors.black, didSelectCategory),
              Display(Icons.map_outlined, "Geography", Colors.black,
                  didSelectCategory),
              Display(
                  Icons.music_note, "Music", Colors.black, didSelectCategory),
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
