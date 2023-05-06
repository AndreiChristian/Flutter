import 'package:flutter/material.dart';

class CounterOutput extends StatelessWidget {
  const CounterOutput({super.key, required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text(count),
    );
  }
}
