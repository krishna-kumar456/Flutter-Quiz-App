import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestions() {
    setState(() {
      questionIndex += 1;
      print(questionIndex);
    });
    print("Answered Question!");
  }

  @override
  Widget build(BuildContext context) {
    //var questions = ["What's my fav color?", "What's my fav animal"];

    var questions = [
      {
        "questionText": "What's my fav color?",
        "answer": ["Red", "Green", "Blue"]
      },
      {
        "questionText": "What's my fav animal?",
        "answer": ["Goat", "Tiger", "Peacock"]
      }
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "First App",
        ),
      ),
      body: Column(
        children: [
          Question(questions[questionIndex]["questionText"]),
          ...(questions[questionIndex]["answer"] as List<String>).map((answer) {

            return Answer(answerQuestions, answer);
          }).toList()
        ],
      ),
    ));
  }
}
