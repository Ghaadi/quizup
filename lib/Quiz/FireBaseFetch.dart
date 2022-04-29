import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuestionFetch {
  String username = '';
  Map<dynamic, dynamic> questions = {};
  String category_name = '';
  List<Map<String, dynamic>> questionList = [{}];

  Future<List<Map<dynamic, dynamic>>> getData(String path) async {
    List<Map<dynamic, dynamic>> fin_questions;

    final snapshot =
        await FirebaseDatabase.instance.reference().child(path).get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    questions.addAll(map);

    fin_questions = FormatData_Question(map);
    return fin_questions;
  }

  QuestionFetch(String jsonPath, String Uid) {
    getData(category_path_parser(jsonPath));

    getUsername(Uid);
    category_name = category_path_parser(jsonPath);
  }

  Map<dynamic, dynamic> getQuestions() {
    return questions;
  }

  void randomize(List<Map<String, dynamic>> questions) {
    for (var question in questions) {
      final listOfanswers = question["answers"] as List;

      listOfanswers.shuffle();
    }
  }

  Future<String> getUsername(String Uid) async {
    final snapshot = await FirebaseDatabase.instance
        .reference()
        .child('users/$Uid/username')
        .get();

    final username1 = snapshot.value as String;

    username = username1;

    return username;
  }

  List<Map<String, dynamic>> getQuestionList() {
    return questionList;
  }

  String getUser() {
    return username;
  }

  String category_path_parser(String name) {
    switch (name) {
      case "Computer Science":
        return "Categories/Category A: Software Engineering";
      case "Lebanon":
        return "/Categories/Category C: Lebanon";

      case "History":
        return "Categories/Category J: World History";

      case "Aub info":
        return "Categories/Category D: AUB info";

      case "Computers":
        return "/Categories/Category G: Computers";

      case "Sports":
        return "/Categories/Category H Sports: ";

      case "Math":
        return "/Categories/Category I: Mathematics";

      case "Health":
        return "/Categories/Category F: Public Health & Nutrition";

      case "General knowledge":
        return "/Categories/Category B: General Knowledges";

      default:
        return "";
    }
  }

  List<Map<String, dynamic>> FormatData_Question(data) {
    var questions = [
      {
        'question': data["Q1"]["question"],
        'answers': [
          {'text': data["Q1"]["answers"][0], 'points': 0},
          {'text': data["Q1"]["correct answer"], 'points': 1},
          {'text': data["Q1"]["answers"][1], 'points': 0},
          {'text': data["Q1"]["answers"][2], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q2"]["question"],
        'answers': [
          {'text': data["Q2"]["answers"][1], 'points': 0},
          {'text': data["Q2"]["correct answer"], 'points': 1},
          {'text': data["Q2"]["answers"][2], 'points': 0},
          {'text': data["Q2"]["answers"][0], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q3"]["question"],
        'answers': [
          {'text': data["Q3"]["answers"][1], 'points': 0},
          {'text': data["Q3"]["correct answer"], 'points': 1},
          {'text': data["Q3"]["answers"][0], 'points': 0},
          {'text': data["Q3"]["answers"][2], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q4"]["question"],
        'answers': [
          {'text': data["Q4"]["answers"][0], 'points': 0},
          {'text': data["Q4"]["correct answer"], 'points': 1},
          {'text': data["Q4"]["answers"][1], 'points': 0},
          {'text': data["Q4"]["answers"][2], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q5"]["question"],
        'answers': [
          {'text': data["Q5"]["answers"][2], 'points': 0},
          {'text': data["Q5"]["correct answer"], 'points': 1},
          {'text': data["Q5"]["answers"][1], 'points': 0},
          {'text': data["Q5"]["answers"][0], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q6"]["question"],
        'answers': [
          {'text': data["Q6"]["answers"][2], 'points': 0},
          {'text': data["Q6"]["correct answer"], 'points': 1},
          {'text': data["Q6"]["answers"][1], 'points': 0},
          {'text': data["Q6"]["answers"][0], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q7"]["question"],
        'answers': [
          {'text': data["Q7"]["answers"][2], 'points': 0},
          {'text': data["Q7"]["correct answer"], 'points': 1},
          {'text': data["Q7"]["answers"][1], 'points': 0},
          {'text': data["Q7"]["answers"][0], 'points': 0},
        ],
        'image': null,
      },
      {
        'question': data["Q8"]["question"],
        'answers': [
          {'text': data["Q8"]["answers"][2], 'points': 0},
          {'text': data["Q8"]["correct answer"], 'points': 1},
          {'text': data["Q8"]["answers"][1], 'points': 0},
          {'text': data["Q8"]["answers"][0], 'points': 0},
        ],
        'image': null,
      },
    ];

    questionList = questions;

    randomize(questionList);
    return questionList;
  }
}
