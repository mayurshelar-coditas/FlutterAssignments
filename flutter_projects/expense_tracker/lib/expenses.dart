import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      dateTime: DateTime.now(),
      amount: 19.99,
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      dateTime: DateTime.now(),
      amount: 20.86,
      category: Category.leisure,
    ),
    Expense(
      title: 'Lunch',
      dateTime: DateTime.now(),
      amount: 80.90,
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("chart"),
            ExpensesList(listOfExpenses: _registeredExpenses),
          ],
        ),
      ),
    );
  }
}
