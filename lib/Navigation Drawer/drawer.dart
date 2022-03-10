import 'package:flutter/material.dart';
import 'package:quizup_prototype/Navigation%20Drawer/option.dart';
import 'package:quizup_prototype/Navigation%20Drawer/profile.dart';

class NavDrawer extends StatelessWidget {
  final String _username = "Salim Jarmakani";
  final String _title = "Intermediate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      endDrawer: SizedBox(
        width: 3.3 * MediaQuery.of(context).size.width / 5,
        child: Drawer(
          backgroundColor: const Color(0xFF1A1D1A), // Eerie Black
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 40, 0, 0),
                child: Profile(_username, _title),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 3), child: Divider(
                color: Colors.white,
              ),),
              const Option(
                Icons.home_outlined,
                "Home",
                Colors.yellowAccent,
              ),
              const Option(
                Icons.account_tree_outlined,
                "Topics",
                Colors.red,
              ),
              const Option(
                Icons.tag_faces_outlined,
                "Friends",
                Colors.green,
              ),
              const Option(
                Icons.apps_outlined,
                "History",
                Colors.blue,
              ),
              const Option(
                Icons.chat_bubble_outline,
                "Discussions",
                Colors.lightBlueAccent,
              ),
              const Option(
                Icons.lock_clock_outlined,
                "Achievements",
                Colors.yellow,
              ),
              const Option(
                Icons.settings_outlined,
                "Settings",
                Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: NavDrawer(),
    ),
  );
}
