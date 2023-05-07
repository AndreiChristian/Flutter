import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses/models/expense.dart'
    as expense_category;

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

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
            ElevatedButton(onPressed: () {}, child: const Text("Add"))
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
