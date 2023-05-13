import 'package:flutter/material.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/screens/categories.dart';
import 'package:todo_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsStateScreen();
  }
}

class _TabsStateScreen extends State<TabsScreen> {
  int _selectedIndex = 0;

  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavourite(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      _favouriteMeals.remove(meal);
    } else {
      _favouriteMeals.add(meal);
    }
    print("the function is called");
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _activeScreen = CategoriesScreen(
      onToggleFavourite: _toggleMealFavourite,
    );
    var activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      _activeScreen = MealsScreen(
        meals: _favouriteMeals,
        title: "",
        onToggleFavourite: (meal) {
          _toggleMealFavourite(meal);
        },
      );
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: _activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
