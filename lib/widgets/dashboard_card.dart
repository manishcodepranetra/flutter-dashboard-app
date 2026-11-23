import 'package:flutter/material.dart';
import '../models/task_model.dart';

class DashboardCard extends StatelessWidget {
  final TaskModel task;

  const DashboardCard({super.key, required this.task});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF91F58F);
      case 'Pending':
        return const Color(0xFF36A0F5);
      case 'Done':
        return const Color(0xFFE8E8ED);
      default:
        return Colors.grey.shade300;
    }
  }

  Color _getStatusTextColor(String status) {
    if (status == 'Done') {
      return const Color(0xFF555568);
    }
    return const Color(0xFF17202A);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF24242B),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  task.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF777781),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            constraints: const BoxConstraints(minWidth: 64),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: _getStatusColor(task.status),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              task.status,
              style: TextStyle(
                color: _getStatusTextColor(task.status),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
