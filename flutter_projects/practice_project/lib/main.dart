import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          // toolbarHeight: 10,
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text(" "),
        ),
      ),
    ),
  );
}
