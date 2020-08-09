import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIdx;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIdx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('The answer!'),
        //Text(questions.elementAt(0)), // 陣列元素取法
        // Text(_questions.elementAt(_questionIdx)),
        // 改用Question去表達題目
        Question(
          questions[questionIdx]['questionText'],
        ),
        // ...這個operator有點難懂 第45講 建議再看一次
        // 告知Dart 這些answers是一個List<String>
        ...(questions[questionIdx]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
