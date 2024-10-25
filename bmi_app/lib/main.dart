// main.dart
import 'package:flutter/material.dart';
import 'bmi_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: const BMIUI(),
    );
  }
}
