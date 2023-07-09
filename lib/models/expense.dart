import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

//final  formatDate = DateFormat.yMd();

const categoryIcon = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_class,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return DateFormat.yMEd().format(date);
  }
}

class ExpenseBucket {
  final Category category;
  List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalAmounts {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
