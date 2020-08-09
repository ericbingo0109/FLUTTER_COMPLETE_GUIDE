import 'package:flutter/material.dart';

import './question.dart'; // ./代表在跟main.dart同一個資料夾底下去找

/**
 * 重要章節可再複習一次：第36講
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

  var _questions = [
    'Q1 : What\'s your favorite color?',
    'Q2 : What\'s your favorite animal???????'
  ];

  void answerQuestion() {
    // 重要：透過setState 這個匿名函式去改變state
    setState(() {
      _questionIdx++;
    });
    print('answer choosed!!!');
    print('questionIdx = ' + _questionIdx.toString()); // 數字轉字串
    print('questions array 有 ' +
        _questions.length.toString() +
        ' 個元素'); // number of elements in array
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: Column(
          children: [
            Text('The answer!'),
            //Text(questions.elementAt(0)), // 陣列元素取法
            // Text(_questions.elementAt(_questionIdx)),
            // 改用Question去表達題目
            Question(
              _questions[_questionIdx],
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              // anonymous function 也可以用匿名函式
              onPressed: () => print('Answer 2 chosen~~~'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              // 這樣也是匿名函式的寫法
              onPressed: () {
                print('Answer 3 hello QQQQ');
              },
            ),
          ],
        ),
      ),
    );
  }
}
