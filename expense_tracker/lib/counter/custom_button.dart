import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {super.key, required this.modifyCount, required this.text});

  final void Function() modifyCount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: modifyCount,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
      child: Text(text),
    );
  }
}
