import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense, {super.key});

  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcon[expense.category],
                      size: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
