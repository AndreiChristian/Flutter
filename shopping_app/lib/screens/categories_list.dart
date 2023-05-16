import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...groceryItems.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const Spacer(),
              ],
            ),
          );
        })
      ],
    );
  }
}
