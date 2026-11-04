import 'package:flutter/material.dart';
import '../models/task.dart';
import '../theme/app_theme.dart';
import '../utils/date_labels.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;
  final void Function(DateTime? newDate) onDueDateChanged;

  const TaskCard({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    required this.onDueDateChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: task.dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDueDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = dueDateLabel(task.dueDate, task.isCompleted);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  key: ValueKey('task_checkbox_${task.id}'),
                  value: task.isCompleted,
                  onChanged: (v) => onToggle(v ?? false),
                ),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: task.isCompleted
                          ? AppTheme.textSecondary
                          : AppTheme.textPrimary,
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    child: Text(
                      task.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  key: ValueKey('task_delete_${task.id}'),
                  icon: const Icon(Icons.delete_outline),
                  color: AppTheme.destructive,
                  onPressed: onDelete,
                  tooltip: 'Delete task',
                ),
              ],
            ),
            if (task.dueDate != null)
              Padding(
                padding: const EdgeInsets.only(left: 48, bottom: 8),
                child: Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceMuted,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.event,
                            size: 14,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${task.dueDate!.year}-${task.dueDate!.month.toString().padLeft(2, '0')}-${task.dueDate!.day.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (label != null)
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: label.startsWith('Overdue')
                              ? AppTheme.destructive
                              : AppTheme.primary,
                        ),
                      ),
                    IconButton(
                      icon: const Icon(Icons.edit_calendar, size: 18),
                      color: AppTheme.textSecondary,
                      onPressed: () => _pickDate(context),
                      tooltip: 'Edit due date',
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      color: AppTheme.textSecondary,
                      onPressed: () => onDueDateChanged(null),
                      tooltip: 'Clear due date',
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
