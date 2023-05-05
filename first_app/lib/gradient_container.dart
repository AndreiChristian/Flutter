import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorOne, this.colorTwo, {super.key});

  const GradientContainer.purple({super.key})
      : colorOne = Colors.purple,
        colorTwo = Colors.indigo;

  final Color colorOne;
  final Color colorTwo;

  @override
  Widget build(context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colorOne, colorTwo],
                begin: startAlignment,
                end: endAlignment)),
        child: const DiceRoller());
  }
}
