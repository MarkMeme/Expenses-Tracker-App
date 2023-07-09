import 'package:expense_tracker_app/components/Expenses_list.dart';
import 'package:expense_tracker_app/components/chart/chart.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/screens/new_expense_sheet.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _regesterdExpenses = [
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

  void _addExpense(Expense expense) {
    _regesterdExpenses.add(expense);
    setState(() {});
  }

  void _onRemeveExpense(Expense expense) {
    var expenseIndex = _regesterdExpenses.indexOf(expense);
    setState(() {
      _regesterdExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _regesterdExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: const Text("Expense is removed !")));
  }

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
        body: _regesterdExpenses.isNotEmpty == true
            ? Column(
                children: [
                  Chart(expenses: _regesterdExpenses),
                  Expanded(
                      child: ExpensesList(
                          expenses: _regesterdExpenses,
                          removeExpense: _onRemeveExpense)),
                ],
              )
            : const Center(child: Text("Add some Expenses..")));
  }

  _openNewEpenseSheet() {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (ctx) => NewExpenseSheet(onAddExpense: _addExpense),
    );
  }
}
