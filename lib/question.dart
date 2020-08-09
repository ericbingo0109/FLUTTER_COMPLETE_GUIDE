// tip : 打st會出現 snippets 可以選StatelessWidget

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    print('傳入的questionText為' + questionText);
    print('this.questionText為' + this.questionText);
    // tip : control + space可以顯示出可用的選項
    /* 這樣的寫法在android看的時候實際並沒有置中
    return Text(
      questionText,
      style: TextStyle(
        fontSize: 28,
      ),
      textAlign: TextAlign.center,
    );
    */
    // tip : 按住command 箭頭移到想看的類別會顯示出原始碼
    //實際置中要用Container去包，置中的關鍵在width: double.infinity
    // 讓這個Container依照實際螢幕尺寸的四個方向有平均寬度
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
