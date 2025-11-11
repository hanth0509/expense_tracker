import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
enum ExpenseCategory {
  @HiveField(0)
  food,
  
  @HiveField(1)
  transportation,
  
  @HiveField(2)
  shopping,
  
  @HiveField(3)
  entertainment,
  
  @HiveField(4)
  bills,
  
  @HiveField(5)
  healthcare,
  
  @HiveField(6)
  other,
}

@HiveType(typeId: 1)
class Expense {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final ExpenseCategory category;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final String? note;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });

  // Helper methods cho category
  String get categoryName {
    switch (category) {
      case ExpenseCategory.food:
        return 'Food';
      case ExpenseCategory.transportation:
        return 'Transportation';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.entertainment:
        return 'Entertainment';
      case ExpenseCategory.bills:
        return 'Bills';
      case ExpenseCategory.healthcare:
        return 'Healthcare';
      case ExpenseCategory.other:
        return 'Other';
    }
  }

  String get categoryEmoji {
    switch (category) {
      case ExpenseCategory.food:
        return '🍔';
      case ExpenseCategory.transportation:
        return '🚗';
      case ExpenseCategory.shopping:
        return '🛍️';
      case ExpenseCategory.entertainment:
        return '🎬';
      case ExpenseCategory.bills:
        return '📄';
      case ExpenseCategory.healthcare:
        return '🏥';
      case ExpenseCategory.other:
        return '📦';
    }
  }

  IconData get categoryIcon {
    switch (category) {
      case ExpenseCategory.food:
        return Icons.restaurant;
      case ExpenseCategory.transportation:
        return Icons.directions_car;
      case ExpenseCategory.shopping:
        return Icons.shopping_bag;
      case ExpenseCategory.entertainment:
        return Icons.movie;
      case ExpenseCategory.bills:
        return Icons.receipt;
      case ExpenseCategory.healthcare:
        return Icons.local_hospital;
      case ExpenseCategory.other:
        return Icons.category;
    }
  }

  Color get categoryColor {
    switch (category) {
      case ExpenseCategory.food:
        return const Color(0xFFEF4444);
      case ExpenseCategory.transportation:
        return const Color(0xFF3B82F6);
      case ExpenseCategory.shopping:
        return const Color(0xFF8B5CF6);
      case ExpenseCategory.entertainment:
        return const Color(0xFFF59E0B);
      case ExpenseCategory.bills:
        return const Color(0xFF10B981);
      case ExpenseCategory.healthcare:
        return const Color(0xFF06B6D4);
      case ExpenseCategory.other:
        return const Color(0xFF6B7280);
    }
  }
}