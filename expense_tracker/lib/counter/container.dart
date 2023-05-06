import 'package:flutter/material.dart';

class CounterContainer extends StatelessWidget {
  const CounterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: const Text(
                    "-",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Count",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 40),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: const Text("+"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
