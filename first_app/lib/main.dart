import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: const Center(
        child: Text(
          "Hello world",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  )));
}
