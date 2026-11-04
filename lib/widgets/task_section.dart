import 'package:flutter/material.dart';
import '../models/task.dart';
import '../theme/app_theme.dart';
import 'empty_state.dart';
import 'task_card.dart';

class TaskSection extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  final IconData emptyIcon;
  final String emptyTitle;
  final String emptySubtitle;
  final ValueChanged<Task> onToggle;
  final ValueChanged<String> onDelete;
  final void Function(Task task, DateTime? newDate) onDueDateChanged;

  const TaskSection({
    super.key,
    required this.title,
    required this.tasks,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptySubtitle,
    required this.onToggle,
    required this.onDelete,
    required this.onDueDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${tasks.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (tasks.isEmpty)
          Center(
            child: EmptyState(
              icon: emptyIcon,
              title: emptyTitle,
              subtitle: emptySubtitle,
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: tasks
                  .map(
                    (t) => TaskCard(
                      task: t,
                      onToggle: (v) => onToggle(t.copyWith(isCompleted: v)),
                      onDelete: () => onDelete(t.id),
                      onDueDateChanged: (d) => onDueDateChanged(t, d),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
