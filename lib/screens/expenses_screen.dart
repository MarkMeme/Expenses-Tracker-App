import 'package:expense_tracker_app/components/Expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/screens/new_expense_sheet.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _dummyData = [
    Expense(
        title: 'Course',
        amount: 13.2,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cenima',
        amount: 16.0,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openNewEpenseSheet,
              icon: const Icon(Icons.add_box_outlined))
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(child: ExpensesList(expenses: _dummyData)),
        ],
      ),
    );
  }

  _openNewEpenseSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenseSheet(),
    );
  }
}
