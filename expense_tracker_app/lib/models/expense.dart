import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Expense {
  final String id = Uuid().v4();
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  });
}

enum Category { food, work, leisure, travel }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
