import 'package:flutter/material.dart';
import 'package:expense_tracker/counter/custom_button.dart';
import 'package:expense_tracker/counter/counter_output.dart';

class CounterContainer extends StatefulWidget {
  const CounterContainer({super.key});

  @override
  State<CounterContainer> createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  int count = 0;

  increment() {
    setState(() {
      count++;
    });
  }

  decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(modifyCount: decrement, text: "-"),
                CounterOutput(
                  count: count.toString(),
                ),
                CounterButton(modifyCount: increment, text: "+")
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
