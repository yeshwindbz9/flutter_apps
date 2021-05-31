import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text(
            'Quizsy',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'SF-Bold',
              letterSpacing: 1,
            ),
          ),
          backgroundColor: Colors.blueGrey.shade900,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkInput(bool input){
    if(quizBrain.isFinished()){
      Alert(
        title: "That\'s it!",
        style: AlertStyle(
          backgroundColor: Colors.blueGrey,
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        context: context,
        desc: "The Quiz has ended\nRestarting now.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
      quizBrain.reset();
      scoreKeeper = [];
    }else{
      bool correctInput = quizBrain.getAnswer();
      if(input == correctInput){
        scoreKeeper.add(Icon(Icons.check_rounded, color: Colors.green,),);
      }else{
        scoreKeeper.add(Icon(Icons.close_rounded, color: Colors.red,),);
      }
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                setState(() {
                  checkInput(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                setState(() {
                  checkInput(false);
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

