import 'package:flutter/material.dart';
import 'package:shopping_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Expense Name"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim() == "1") {
                    return "Error";
                  } else {
                    return value;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Quantity")),
                      initialValue: "1",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(category.value.title)
                              ],
                            ))
                    ], onChanged: (value) {}),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Reset"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      iconColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onPrimaryContainer),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primaryContainer),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
