import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(136, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Flutter Quiz",
          style: TextStyle(
              color: Color.fromARGB(255, 232, 175, 195), fontSize: 40),
        ),
        const SizedBox(
          width: 100,
        ),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          label: const Text("Start the quiz"),
          icon: const Icon(Icons.arrow_right_alt),
        )
      ],
    ));
  }
}
