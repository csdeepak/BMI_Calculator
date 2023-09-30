import 'package:flutter/material.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: Colors.lightGreen[900],
        ),
        body: InputPage(),
      ),
    );
  }
}

class InputPage extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputBox(
              label: 'Height (meters)',
              controller: heightController,
              boxColor: Colors.green, // Set the background color here
            ),
            InputBox(
              label: 'Weight (kg)',
              controller: weightController,
              boxColor: Colors.green, // Set the background color here
            ),
            ElevatedButton(
              onPressed: () {
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;
                if (height > 0 && weight > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(height: height, weight: weight),
                    ),
                  );
                }
              },
              child: const Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputBox extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Color boxColor;

  const InputBox({
    Key? key,
    required this.label,
    required this.controller,
    required this.boxColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 150.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20.0),
        color: widget.boxColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

