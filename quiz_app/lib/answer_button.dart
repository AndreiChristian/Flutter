import 'package:flutter/material.dart';

class AnwerButton extends StatelessWidget {
  const AnwerButton(this.answerText, {super.key});

  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text(answerText));
  }
}
