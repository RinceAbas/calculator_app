import 'package:flutter/material.dart';
import 'bmi_controller.dart';

class BMIUI extends StatefulWidget {
  const BMIUI({super.key});

  @override
  State<BMIUI> createState() => _BMIUIState();
}

class _BMIUIState extends State<BMIUI> {
  final BMIController _bmiController = BMIController();
  double? _bmiResult;
  String _bmiCategory = "";

  @override
  void dispose() {
    _bmiController.dispose();
    super.dispose();
  }

  void _calculateAndShowBMI() {
    setState(() {
      _bmiResult = _bmiController.calculateBMI();
      _bmiController.determineBMICategory();
      _bmiCategory = _bmiController.bmiCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 100,  // Set desired width
              height: 100, // Set desired height
            ),
            const SizedBox(height: 16),
            const Text('Input your weight and height'),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _bmiController.weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _bmiController.heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (m)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _calculateAndShowBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 16),
            if (_bmiResult != null) ...[
              Text('Your BMI is ${_bmiResult!.toStringAsFixed(1)}'),
              Text('Category: $_bmiCategory'),
            ],
          ],
        ),
      ),
    );
  }
}
