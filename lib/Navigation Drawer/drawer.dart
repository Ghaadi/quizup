import 'package:flutter/material.dart';
import 'package:quizup_prototype/Navigation%20Drawer/option.dart';
import 'package:quizup_prototype/Navigation%20Drawer/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'dart:ffi';

class NavDrawer extends StatelessWidget {
  final String _username;
  final String _title = "Intermediate";

  const NavDrawer(this._username);

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/');
    }

    return SizedBox(
      width: 2.2 * MediaQuery.of(context).size.width / 3,
      child: Drawer(
        backgroundColor: const Color(0xFF1A1D1A), // Eerie Black
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 40, 0, 0),
              child: Profile(_username, _title),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Divider(
                color: Colors.white,
              ),
            ),
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
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _signOut,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.red,
                width: double.infinity,
                height: 65,
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
