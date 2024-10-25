// bmi_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bmi_controller.dart';

class BMIUI extends ConsumerWidget {
  const BMIUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmiController = ref.watch(bmiControllerProvider);
    final bmiState = bmiController.state;

    final weightController = TextEditingController();
    final heightController = TextEditingController();

    void _calculateAndShowBMI() {
      final weight = double.tryParse(weightController.text) ?? 0;
      final height = double.tryParse(heightController.text) ?? 1; // Avoid division by zero
      bmiController.calculateBMI(weight, height);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text('Input your weight and height'),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: TextField(
                controller: weightController,
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
                controller: heightController,
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
            if (bmiState.bmi != null) ...[
              Text('Your BMI is ${bmiState.bmi!.toStringAsFixed(1)}'),
              Text('Category: ${bmiState.category}'),
            ],
          ],
        ),
      ),
    );
  }
}
