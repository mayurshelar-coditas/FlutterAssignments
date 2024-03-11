import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.listOfExpenses});

  final List<Expense> listOfExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseItem(
        expense: listOfExpenses[index],
      ),
      itemCount: listOfExpenses.length,
    );
  }
}
