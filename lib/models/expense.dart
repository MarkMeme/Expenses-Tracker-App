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
