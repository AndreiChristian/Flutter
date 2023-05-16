import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/provider/favourites_provider.dart';
import 'package:todo_app/provider/meal_provider.dart';
import 'package:todo_app/screens/categories.dart';
import 'package:todo_app/screens/filters.dart';
import 'package:todo_app/screens/meals.dart';
import 'package:todo_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsStateScreen();
  }
}

class _TabsStateScreen extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String indentifer) async {
    Navigator.of(context).pop();
    if (indentifer == "filters") {
      final filter = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
      setState(() {
        _selectedFilters = filter ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final providedMeals = ref.watch(mealsProvider);
    final availableMeals = providedMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    Widget _activeScreen = CategoriesScreen(
      avialableMeals: availableMeals,
    );
    var activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      final providedFavouriteMeals = ref.watch(favouriteMealsProvider);
      _activeScreen = MealsScreen(
        meals: providedFavouriteMeals,
        title: "",
      );
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
