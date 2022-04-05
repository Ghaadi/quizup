import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Color _backgroundColor = const Color(0xFF64DD17);
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: !isSearching ? Text('All Topics') : Text('here comes '),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search_outlined),
                onPressed: () {
                  // this.isSearching = ! this.isSearching;
                }),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ],
        ),
        body: Container(
          width: 2 * MediaQuery.of(context).size.width / 3,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 50),
          child: Text(
            "Logo",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(home: Category()));
}
