import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // the function simply means that what is stored hear has to be a point at a function
  // Function指的是儲存一個function的pointer
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: selectHandler,
      ),
    );
  }
}
