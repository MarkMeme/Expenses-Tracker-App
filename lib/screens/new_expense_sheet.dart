import 'package:flutter/material.dart';

class NewExpenseSheet extends StatefulWidget {
  @override
  State<NewExpenseSheet> createState() => _NewExpenseSheetState();
}

class _NewExpenseSheetState extends State<NewExpenseSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            maxLength: 20,
            decoration: const InputDecoration(hintText: 'Expense Title'),
          )
        ],
      )),
    );
  }
}
