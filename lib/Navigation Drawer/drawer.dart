import 'package:flutter/material.dart';
import '../Leaderboard/leaderboard.dart';
import '../Navigation Drawer/option.dart';
import '../Navigation Drawer/profile.dart';
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
            Option(
              Icons.home_outlined,
              "Home",
              Colors.yellowAccent,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            Option(
              Icons.account_tree_outlined,
              "Topics",
              Colors.red,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            Option(
              Icons.tag_faces_outlined,
              "Friends",
              Colors.green,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            Option(
              Icons.format_list_numbered_rtl_sharp,
              "Leaderboard",
              Colors.lightBlueAccent,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            Option(
              Icons.lock_clock_outlined,
              "Achievements",
              Colors.yellow,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            Option(
              Icons.settings_outlined,
              "Settings",
              Colors.grey,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Leaderboard(),
                ),
              ),
            ),
            const Align(
              child: Divider(
                color: Colors.grey,
              ),
              alignment: Alignment.bottomCenter,
            ),
            Container(
              width: 400,
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: _signOut,
                child: Container(
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
