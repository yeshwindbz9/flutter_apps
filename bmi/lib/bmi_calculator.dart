import 'dart:math';

class BMICalculator{
  BMICalculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height /100 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.8){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'That\'s a high BMI, Try to exercise more.';
    }else if(_bmi > 18.8){
      return 'This is a normal BMI, Good Job stay Fit!';
    }else{
      return 'That\'s a low BMI, Try to eat more.';
    }
  }
}