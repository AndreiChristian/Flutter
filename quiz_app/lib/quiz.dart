import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 28, 1, 33),
              Color.fromARGB(255, 86, 21, 99),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: const StartScreen()),
      ),
    );
  }
}
