import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double height;
  final double weight;

  const ResultPage({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String result = getResult(bmi);
    String interpretation = getInterpretation(bmi);

    return Scaffold(
        backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: const Text('BMI Calculator Result'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your BMI: ${bmi.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: getColor(bmi),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            interpretation,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  double calculateBMI() {
    return weight / ((height ) * (height ));
  }

  String getResult(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a much higher than normal body weight. Please consult a doctor.';
    }
  }

  Color getColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
