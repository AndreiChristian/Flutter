import 'package:flutter/material.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/screens/categories.dart';
import 'package:todo_app/screens/meals.dart';
import 'package:todo_app/widgets/main_drawer.dart';

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

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleMealFavourite(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage("Removed from favourites");
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage("Added to favourites");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String indentifer) {
    if (indentifer == "filters") {
    } else {
      Navigator.of(context).pop();
    }
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
          onToggleFavourite: _toggleMealFavourite);
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
