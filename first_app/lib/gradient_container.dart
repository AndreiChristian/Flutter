import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer(this.colorOne, this.colorTwo, {super.key});

  GradientContainer.purple({super.key})
      : colorOne = Colors.purple,
        colorTwo = Colors.indigo;

  final Color colorOne;
  final Color colorTwo;
  var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    print("changed dice");
    activeDiceImage = 'assets/images/dice-1.png';
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colorOne, colorTwo],
              begin: startAlignment,
              end: endAlignment)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/dice-1.png',
            width: 200,
          )),
          const SizedBox(width: 50),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            child: const Text("Press"),
          )
        ],
      ),
    );
  }
}
