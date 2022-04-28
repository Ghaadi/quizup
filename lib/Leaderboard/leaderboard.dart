import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard({Key? key}) : super(key: key);

  var users = ["Rawad", "Ghadi", "Charbel"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Leaderboard"),
      ),
      backgroundColor: const Color(0xFF2E3532),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              title: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_circle_rounded,
                            color: Colors.grey,
                            size: 50,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            users[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${index + 1}  ",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
