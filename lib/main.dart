import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

import './question.dart'; // ./代表在跟main.dart同一個資料夾底下去找
import './answer.dart';
/**
 * 重要章節可再複習一次：第36講, 第45講, 第46講, 
 * 複製同行 shift + option + 方向鍵
 * 
 *  */
/**
 * 答錯的問題紀錄：
 * 測驗4 三題全錯＝＝ 好難啊
 * 問題：What's the core difference between StatelessWidget and StatefulWidget?
 * 正確答案：StatelessWidget cannot re-run build() when its properties change
 * 問題：What's the difference between "Input Data" (also: "External Data) and "Internal Data" in a Widget?
 * 正確答案：Input data is the data received via the constructor of Widget. If that changes, the Widget is rebuilt.
 * 問題：Why do you need to call setState(() { ... }) in a StatefulWidget (when changing some internal data)?
 * 正確答案：Without setState(), the Widget does change its property value 
 * but it will not re-run the build() method. Hence updates aren't reflected on the screen.
 */

/**
 * 如果要將繼承的類別從 StatelessWidget 轉為 StatefulWidget ，會有報錯
 * 可以先去preference -> key shortcut 搜尋refactor看到快捷鍵是control + 大寫R
 * 可以看到 Convert to StatefulWidget 就能將父類別轉成StatefulWidget了！
 * 
 * 注意一下差別，本來是
 * class MyApp extends StatelessWidget {
 *  所有程式...blabla...
 * }
 * 
 * 改為繼承StatefulWidget 之後
 * 變成
 * class MyApp extends StatefulWidget {
 * @override
 * _MyAppState createState() => _MyAppState();
 *}
 * class _MyAppState extends State<MyApp> {
 *  所有程式...blabla...
 * }
 * 
 * 或者這樣寫也可以
 * class MyApp extends StatefulWidget {
 * @override
 * State<StatefulWidget> createState() {
 *   return MyAppState();
 * }
 *}
 *
 * class MyAppState extends State<MyApp> {
 * 所有程式...blabla...
 *}
 * 
 */

/*void main() {
  runApp(MyApp());
}
*/

// 也可以簡短如下
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIdx = 0; // 加上底線代表private 只在MyAppState內部使用

  /**
   * 重要觀念 第46講
   * final --> runtime constant
   * const --> compile time constant
   * compile time constant also implicitly means runtime constant
  */

  final _questions = const [
    // {} 為一個 Map with key and value
    {
      'questionText': 'Q1 : What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ] //value 也可以是一個list
    },
    {
      'questionText': 'Q2 : What\'s your favorite animal ?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snack', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ] //value 也可以是一個list
    },
    {
      'questionText': 'Q3 : What\'s your favorite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ] //value 也可以是一個list
    },
  ];

  // questions = []; does not work if questions is a const

  int _totalScore = 0;

  void _resetQuiz() {
    // setState 不可或缺！將會retrigger state
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    print('問題:' + _questions[_questionIdx]['questionText']);
    //print('選擇的答案-->' + answer);
    _totalScore += score;

    // 重要：透過setState 這個匿名函式去改變state
    setState(() {
      _questionIdx++;
    });
    /*
    print('answer choosed!!!');
    print('questionIdx = ' + _questionIdx.toString()); // 數字轉字串
    print('questions array 有 ' +
        _questions.length.toString() +
        ' 個元素'); // number of elements in array
        */
    print('_totalScore = ' + _totalScore.toString());
  }

  @override
  Widget build(BuildContext context) {
    final dummy = ['Hello'];
    dummy.add('Max');
    print(dummy);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: (_questionIdx < _questions.length)
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIdx: _questionIdx,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
