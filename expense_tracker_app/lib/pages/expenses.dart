import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(
      amount: 5,
      date: DateTime.now(),
      title: 'Burger',
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text("Flutter Expense Tracker"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Text("Flutter Chart"),
          Expanded(child: ExpenseList(expenses: _registeredExpensesList)),
        ],
      ),
    );
  }
}
