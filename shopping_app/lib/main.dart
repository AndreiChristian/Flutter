import 'package:flutter/material.dart';
import 'package:shopping_app/screens/categories_list.dart';
import 'package:shopping_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Groceries',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 7, 25, 9),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 7, 25, 9),
        ),
        home: const GroceryList());
  }
}
