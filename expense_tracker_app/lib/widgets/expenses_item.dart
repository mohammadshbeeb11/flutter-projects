import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  String get formattedDate {
    return DateFormat.yMd().format(expense.date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [

              // title
              Text(expense.title, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  // amount and date
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(categoryIcon[expense.category]),
                      SizedBox(width: 8),
                      Text(formattedDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
