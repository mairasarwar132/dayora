DateTime dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

String? dueDateLabel(DateTime? dueDate, bool isCompleted, {DateTime? now}) {
  if (dueDate == null) return null;
  final today = dateOnly(now ?? DateTime.now());
  final due = dateOnly(dueDate);
  final diff = due.difference(today).inDays;
  if (diff == 0) return 'Today';
  if (diff == 1) return 'Tomorrow';
  if (diff > 1) return '$diff days remaining';
  if (isCompleted) return null;
  return 'Overdue by ${-diff} days';
}
