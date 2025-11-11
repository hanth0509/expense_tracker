import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  late Box<Expense> _expensesBox;

  List<Expense> get expenses => _expensesBox.values.toList();

  double get totalExpenses {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  Future<void> init() async {
    _expensesBox = await Hive.openBox<Expense>('expenses');
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await _expensesBox.put(expense.id, expense);
    notifyListeners();
  }

  Future<void> updateExpense(String id, Expense updatedExpense) async {
    await _expensesBox.put(id, updatedExpense);
    notifyListeners();
  }

  Future<void> deleteExpense(String id) async {
    await _expensesBox.delete(id);
    notifyListeners();
  }

  // Thống kê theo category
  Map<ExpenseCategory, double> get expensesByCategory {
    Map<ExpenseCategory, double> result = {};
    
    for (var expense in expenses) {
      result.update(
        expense.category,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }
    
    return result;
  }

  // Thống kê theo tuần
  List<Expense> getThisWeekExpenses() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    
    return expenses.where((expense) => 
      expense.date.isAfter(startOfWeek.subtract(const Duration(days: 1)))
    ).toList();
  }

  // Thống kê theo tháng
  List<Expense> getThisMonthExpenses() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    
    return expenses.where((expense) => 
      expense.date.isAfter(startOfMonth.subtract(const Duration(days: 1)))
    ).toList();
  }
}