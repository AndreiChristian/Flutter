import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/screens/meals.dart';
import 'package:todo_app/widgets/category_grid_item.dart';
import 'package:todo_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.onToggleFavourite});

  void Function(Meal meal) onToggleFavourite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals,
          title: category.title,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
