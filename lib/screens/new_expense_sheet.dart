import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/models/expense.dart';

class NewExpenseSheet extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const NewExpenseSheet({super.key, required this.onAddExpense});
  @override
  State<NewExpenseSheet> createState() => _NewExpenseSheetState();
}

class _NewExpenseSheetState extends State<NewExpenseSheet> {
  final _titleContoller = TextEditingController();
  final _amountContoller = TextEditingController();
  var _selectedDate = DateTime.now();
  Category _selectedCategory = Category.leisure;

  final _formKey = GlobalKey<FormState>();

  void _presenteDate() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    var packedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = packedDate!;
    });
  }

  void submitForm() {
    if (_formKey.currentState!.validate() == true) {
      double _sekectedAmount = double.tryParse(_amountContoller.text)!;
      widget.onAddExpense(Expense(
          title: _titleContoller.text,
          amount: _sekectedAmount,
          date: _selectedDate,
          category: _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleContoller.dispose();
    _amountContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Expense Title ';
                  }
                  return null;
                },
                controller: _titleContoller,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Expense Title')),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the amount';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _amountContoller,
                      maxLength: 20,
                      decoration: const InputDecoration(
                          prefix: Text('\$ '), label: Text('Expense Amount')),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: _presenteDate,
                          icon: const Icon(Icons.calendar_view_month_outlined)),
                      Text(DateFormat.yMEd().format(_selectedDate))
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toUpperCase()),
                              ))
                          .toList(),
                      onChanged: (category) {
                        if (category == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = category;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: submitForm,
                      child: const Text('Save the title')),
                ],
              )
            ],
          )),
    );
  }
}
