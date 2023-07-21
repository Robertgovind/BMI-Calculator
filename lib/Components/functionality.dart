import 'dart:math';

class CalculatorFunctionlality {
  final int height;
  final int weight;

  CalculatorFunctionlality({required this.height, required this.weight});

  late double bmi;
  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getReslut() {
    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getSuggestion() {
    if (bmi >= 25) {
      return 'You have more weight try to eat less and do exercise daily.';
    } else if (bmi > 18) {
      return 'You are completely normal try to maintain this condition.';
    } else {
      return 'You have less weight eat balance diet and do regular exercise.';
    }
  }
}
