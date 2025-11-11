import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/expense.dart';
import '../utils/constants.dart';

class CategoryChart extends StatelessWidget {
  final Map<ExpenseCategory, double> categoryData;

  const CategoryChart({Key? key, required this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categoryData.isEmpty) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return PieChart(
      PieChartData(
        sections: _buildSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 4,
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final total = categoryData.values.fold(0.0, (sum, amount) => sum + amount);
    
    return categoryData.entries.map((entry) {
      final percentage = (entry.value / total * 100);
      
      // Tạo expense tạm để lấy màu category - ĐẶT TRONG MAP
      final tempExpense = Expense(
        id: 'temp',
        title: 'temp',
        amount: 0,
        category: entry.key,
        date: DateTime.now(),
      );
      
      return PieChartSectionData(
        color: tempExpense.categoryColor,
        value: entry.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}