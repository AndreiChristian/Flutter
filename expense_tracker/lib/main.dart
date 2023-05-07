import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo.shade500);

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 6, 8, 35));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark()
        .copyWith(useMaterial3: true, colorScheme: kDarkColorScheme),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primaryContainer,
            elevation: 1000,
            foregroundColor: kColorScheme.primary),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          elevation: 100,
          shadowColor: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: const TextTheme().copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer,
                fontSize: 16))),
    home: const Expenses(),
    themeMode: ThemeMode.dark,
  ));
}
