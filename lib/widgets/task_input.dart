import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TaskInput extends StatefulWidget {
  final void Function(String title, DateTime? dueDate) onAdd;

  const TaskInput({super.key, required this.onAdd});

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _dueDate;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _dueDate = picked);
    }
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onAdd(text, _dueDate);
    _controller.clear();
    setState(() => _dueDate = null);
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.trim().isNotEmpty;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Add a new task...',
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: _dueDate == null
                    ? AppTheme.textSecondary
                    : AppTheme.primary,
              ),
              onPressed: _pickDate,
              tooltip: 'Set due date',
            ),
            SizedBox(
              height: 48,
              width: 48,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: hasText
                      ? AppTheme.primary
                      : AppTheme.surfaceMuted,
                  foregroundColor: hasText
                      ? Colors.white
                      : AppTheme.textSecondary,
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                ),
                onPressed: _submit,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        if (_dueDate != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.event,
                  size: 14,
                  color: AppTheme.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  '${_dueDate!.year}-${_dueDate!.month.toString().padLeft(2, '0')}-${_dueDate!.day.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
