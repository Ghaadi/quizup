import 'package:flutter/material.dart';
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
        width: 3 * MediaQuery.of(context).size.width / 5,
        child: Drawer(
          backgroundColor: const Color(0xFF2E3532),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 45, 0, 0),
                child: Profile(_username, _title),
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
