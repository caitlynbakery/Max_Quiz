import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetFunction;

  Result(this.resultScore, this.resetFunction);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You have low similarity with Caitlyn';
    } else if (resultScore <= 12) {
      resultText = 'Medium similarity with Caitlyn';
    } else if (resultScore <= 16) {
      resultText = 'You would be a pretty good friend with Caitlyn';
    } else {
      resultText = 'You are best friends with Caitlyn';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: resetFunction,
          )
        ],
      ),
    );
  }
}
