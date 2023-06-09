import 'package:flutter/material.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/screens/meal_detail.dart';
import 'package:todo_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
          );
        });

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oh... no meals here!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try selecting a different category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ));
    }

    if (title.isEmpty) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
