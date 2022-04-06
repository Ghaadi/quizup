import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class QuestionFetch {
  Map<dynamic, dynamic> data = {};

  List<Map<String, Object>> questionList = [];

  Future<void> getData(String path) async {
    final snapshot =
        await FirebaseDatabase.instance.reference().child(path).get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    data.addAll(map);
  }

  QuestionFetch(String jsonPath) {
    getData(jsonPath);
  }

  Map<dynamic, dynamic> getQuestions() {
    return data;
  }

  String test() {
    return data["Q1"]["question"];
  }

  String test2() {
    return data["Q2"]["question"];
  }

  void Format(List<Map<String, Object>> questionL) {
    questionL[0]['question'] = this.test();
    questionL[1]['question'] = this.test2();
  }

  List<Map<String, Object>> getQuestionList() {
    return questionList;
  }

  void FormatData_Question() {
    List<Map<String, Object>> questions = [
      {
        'question': data["Q1"]["question"],
        'answers': [
          {'text': data["answers"][0], 'points': 0},
          {'text': data["answers"][1], 'points': 1},
          {'text': data["answers"][2], 'points': 0},
          {'text': data["answers"][3], 'points': 0},
        ],
        'image': './images/flags/USA.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Syria', 'points': 0},
          {'text': 'Brazil', 'points': 0},
          {'text': 'Jordan', 'points': 0},
          {'text': 'Lebanon', 'points': 1},
        ],
        'image': './images/flags/Lebanon.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Brazil', 'points': 1},
          {'text': 'Argentina', 'points': 0},
          {'text': 'Columbia', 'points': 0},
          {'text': 'Spain', 'points': 0},
        ],
        'image': './images/flags/Brazil.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Columbia', 'points': 0},
          {'text': 'Palestine', 'points': 0},
          {'text': 'Ireland', 'points': 0},
          {'text': 'Cuba', 'points': 1},
        ],
        'image': './images/flags/Cuba.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Poland', 'points': 0},
          {'text': 'Finland', 'points': 0},
          {'text': 'Argentina', 'points': 1},
          {'text': 'England', 'points': 0},
        ],
        'image': './images/flags/Argentina.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Mexico', 'points': 0},
          {'text': 'Canada', 'points': 1},
          {'text': 'Germany', 'points': 0},
          {'text': 'Belgium', 'points': 0},
        ],
        'image': './images/flags/Canada.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Belgium', 'points': 0},
          {'text': 'Netherlands', 'points': 0},
          {'text': 'France', 'points': 1},
          {'text': 'Italy', 'points': 0},
        ],
        'image': './images/flags/France.png',
      },
      {
        'question': 'What country does this flag represent?',
        'answers': [
          {'text': 'Belgium', 'points': 0},
          {'text': 'Netherlands', 'points': 0},
          {'text': 'France', 'points': 1},
          {'text': 'Italy', 'points': 0},
        ],
      },
    ];

    questionList = questions;
  }
}
