import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav kpop group?',
      'answers': [
        {'text': 'BTS', 'score': 8},
        {'text': 'Stray Kids', 'score': 10},
        {'text': 'Twice', 'score': 5},
        {'text': 'Momoland', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your fav dessert?',
      'answers': [
        {'text': 'Pumpkin Pie', 'score': 4},
        {'text': 'Donut', 'score': 5},
        {'text': 'Macaroon', 'score': 7},
        {'text': 'Cake', 'score': 10}
      ]
    },
    {
      'questionText': 'Where\'s your dream vacation?',
      'answers': [
        {'text': 'Hawaii', 'score': 6},
        {'text': 'Japan', 'score': 9},
        {'text': 'South Korea', 'score': 10},
        {'text': 'New Zealand', 'score': 4}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
