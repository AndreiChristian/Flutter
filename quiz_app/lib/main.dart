import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 28, 1, 33),
            Color.fromARGB(255, 86, 21, 99),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: const StartScreen()),
    ),
  ));
}
