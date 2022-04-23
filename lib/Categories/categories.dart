import 'package:flutter/material.dart';

import './display.dart';
import '../Navigation Drawer/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Quiz/FireBaseFetch.dart';
import './offlineCategories.dart';

class Categories extends StatefulWidget {
  // const Categories({required this.didSelectCategory});
  @override
  State<StatefulWidget> createState() => categories();
}

class categories extends State<Categories> {
  var username = '';
  final Color _backgroundColor = Colors.green;

  final user = FirebaseAuth.instance.currentUser!;

  late Future _nameLoader;
  _getName() async {
    final name = QuestionFetch('', user.uid);

    String name1 = await name.getUsername(user.uid);

    username = name1;
  }

  @override
  void initState() {
    super.initState();

    _nameLoader = _getName();
  }

  @override
  Widget build(BuildContext context) {
    return (username == '')
        ? FutureBuilder(
            future: _nameLoader,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
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
                            child: const Display(
                                Icons.badge, "Logo", Colors.black),
                          ),
                          const Display(
                              Icons.flag_rounded, "Lebanon", Colors.black),
                          const Display(Icons.sports_basketball_outlined,
                              "Sports", Colors.black),
                          const Display(
                              Icons.code, "Computer Science", Colors.black),
                          const Display(
                              Icons.book_outlined, "History", Colors.black),
                          const Display(
                              Icons.biotech_outlined, "Aub info", Colors.black),
                          const Display(Icons.computer, "Tech", Colors.black),
                          const Display(
                              Icons.map_outlined, "Geography", Colors.black),
                          const Display(
                              Icons.music_note, "Music", Colors.black),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return OfflineCategories(username);
              }
            })
        : OfflineCategories(username);
  }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Categories(),
//     ),
//   );
// }
}
