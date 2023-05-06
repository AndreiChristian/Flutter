import 'package:expense_tracker/expenses/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 19.99,
        date: DateTime.now(),
        title: "Flutter Course",
        category: Category.work),
    Expense(
        amount: 16.99,
        date: DateTime.now(),
        title: "Cinema",
        category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
          const Text('data'),
        ],
      ),
    );
  }
}
