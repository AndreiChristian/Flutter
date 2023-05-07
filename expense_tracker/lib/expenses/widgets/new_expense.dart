import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses/models/expense.dart'
    as expense_category;

class NewExpense extends StatefulWidget {
  NewExpense({Key? key, required this.onAddExpense}) : super(key: key);

  final void Function(expense_category.Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  expense_category.Category? _selectedCategory;

  DateTime? selectedDate = DateTime.now();

  void _showPresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  _submitExpenseData() {
    final double? enteredAmount = double.tryParse(_amountControler.text);

    if (_titleControler.text.trim().isEmpty ||
        (enteredAmount == null || enteredAmount <= 0) ||
        (selectedDate == null) ||
        _selectedCategory == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Please make sure a valid title, amount and dialog are correct!"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"))
                ],
              ));
      return;
    } else {
      widget.onAddExpense(expense_category.Expense(
          amount: enteredAmount,
          date: selectedDate!,
          title: _titleControler.text,
          category: _selectedCategory!));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleControler,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("Title")),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _amountControler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "\$ ")),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(selectedDate
                      .toString()
                      .split(" ")[0]
                      .split("-")
                      .join("/")),
                  IconButton(
                      onPressed: _showPresentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: expense_category.Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            const Spacer(),
            ElevatedButton(
                onPressed: _submitExpenseData, child: const Text("Add"))
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }
}
