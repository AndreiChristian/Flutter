import 'package:expense_tracker/expenses/widgets/expenses_list.dart';
import 'package:expense_tracker/expenses/widgets/new_expense.dart';
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

  void _addExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NewExpense(
              onAddExpense: _addExpense,
            ),
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 3000),
        content: const Text("Expense deleted successfully!"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(),
        actions: [
          IconButton(onPressed: _addExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
          const Text('data'),
        ],
      ),
    );
  }
}
