import 'package:expense_tracker_app/components/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses});

  List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
