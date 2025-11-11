import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../widgets/category_chart.dart';
import '../models/expense.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: AppColors.primary,
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, child) {
          final categoryData = expenseProvider.expensesByCategory;
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Pie Chart
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Spending by Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          child: CategoryChart(categoryData: categoryData),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Category Breakdown
              // Trong phần Category Breakdown - SỬA THÀNH:
              ...categoryData.entries.map((entry) {
                final percentage = expenseProvider.totalExpenses > 0 
                    ? (entry.value / expenseProvider.totalExpenses * 100)
                    : 0;
                
                // Tạo expense tạm để lấy thông tin category
                final tempExpense = Expense(
                  id: 'temp',
                  title: 'temp',
                  amount: 0,
                  category: entry.key,
                  date: DateTime.now(),
                );
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: tempExpense.categoryColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tempExpense.categoryIcon,
                        color: tempExpense.categoryColor,
                      ),
                    ),
                    title: Text(tempExpense.categoryName),
                    subtitle: Text('${percentage.toStringAsFixed(1)}% of total'),
                    trailing: Text(
                      '\$${entry.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}