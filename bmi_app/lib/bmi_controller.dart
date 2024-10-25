// bmi_controller.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bmi_state.dart';

class BMIController extends ChangeNotifier {
  BMIState _state = BMIState();
  BMIState get state => _state;

  void calculateBMI(double weight, double height) {
    if (height == 0) {
      return; // Prevent division by zero
    }
    final bmi = weight / (height * height);
    String category = _determineBMICategory(bmi);

    // Update the state and notify listeners
    _state = BMIState(bmi: bmi, category: category);
    notifyListeners();
  }

  String _determineBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25.0) return "Normal";
    if (bmi < 30.0) return "Overweight";
    if (bmi < 35.0) return "Obesity Level 1";
    if (bmi < 40.0) return "Obesity Level 2";
    return "Extreme Obesity";
  }
}

// Create a ChangeNotifierProvider for your BMIController
final bmiControllerProvider = ChangeNotifierProvider<BMIController>(
  (ref) => BMIController(),
);
