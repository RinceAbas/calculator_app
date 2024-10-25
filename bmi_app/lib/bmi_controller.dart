import 'package:flutter/material.dart';

class BMIController {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String bmiCategory = "";

  double calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    return weight / (height * height);
  }

  void determineBMICategory() {
    double bmi = calculateBMI();

    if (bmi < 18.5) {
      bmiCategory = "Underweight";
    } else if (bmi < 25.0) {
      bmiCategory = "Normal";
    } else if (bmi < 30.0) {
      bmiCategory = "Overweight";
    } else if (bmi < 35.0) {
      bmiCategory = "Obesity Level 1";
    } else if (bmi < 40.0) {
      bmiCategory = "Obesity Level 2";
    } else {
      bmiCategory = "Extreme Obesity";
    }
  }

  void dispose() {
    weightController.dispose();
    heightController.dispose();
  }
}
