import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank_sharp,
  Category.leisure: Icons.movie_filter,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    var day = date.toLocal().toString().split(" ")[0];
    var fday = day.split("-");
    return fday.join("/");
  }
}
