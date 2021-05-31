import 'question.dart';
class QuizBrain{

  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('It’s impossible to hum while you hold your nose.', true),
    Question('Black holes are black.', false),
    Question('Bees can detect bombs.', true),
    Question('Newborns don’t shed tears.', true),
    Question('Walt Disney was the one who drew Mickey Mouse', false),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'Plants grow faster when there\'s music playing.', true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question('There are McDonald’s one every continent except one.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question('The developer of this app is awesome.', true),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1){
      _questionNumber += 1;
    }
  }

  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber == _questionBank.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }

}