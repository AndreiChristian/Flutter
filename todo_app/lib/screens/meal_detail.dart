import 'package:flutter/material.dart';
import 'package:todo_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(meal.imageUrl),
        ),
      ),
    );
  }
}
