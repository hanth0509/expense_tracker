import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../utils/constants.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ExpenseTile({
    Key? key,
    required this.expense,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
           color: expense.categoryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            expense.categoryIcon,
            color: expense.categoryColor,
            size:20,
          ),
        ),
        title: Text(
          expense.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${expense.categoryName} • ${_formatDate(expense.date)}',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            if (expense.note != null && expense.note!.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                expense.note!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
        trailing: Text(
          '\$${expense.amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  // IconData _getCategoryIcon(ExpenseCategory category) {
  //   switch (category) {
  //     case ExpenseCategory.food:
  //       return Icons.restaurant;
  //     case ExpenseCategory.transportation:
  //       return Icons.directions_car;
  //     case ExpenseCategory.shopping:
  //       return Icons.shopping_bag;
  //     case ExpenseCategory.entertainment:
  //       return Icons.movie;
  //     case ExpenseCategory.bills:
  //       return Icons.receipt;
  //     case ExpenseCategory.healthcare:
  //       return Icons.local_hospital;
  //     case ExpenseCategory.other:
  //       return Icons.category;
  //   }
  // }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}