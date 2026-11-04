import 'package:flutter/material.dart';
import '../models/task.dart';
import '../theme/app_theme.dart';
import '../widgets/task_input.dart';
import '../widgets/task_section.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  List<Task> get _pending => _tasks.where((t) => !t.isCompleted).toList();
  List<Task> get _completed => _tasks.where((t) => t.isCompleted).toList();

  void _addTask(String title, DateTime? dueDate) {
    setState(() {
      _tasks.add(
        Task(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: title,
          createdAt: DateTime.now(),
          dueDate: dueDate,
        ),
      );
    });
  }

  void _toggleTask(Task updated) {
    setState(() {
      final idx = _tasks.indexWhere((t) => t.id == updated.id);
      if (idx != -1) _tasks[idx] = updated;
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((t) => t.id == id);
    });
  }

  void _updateDueDate(Task task, DateTime? newDate) {
    setState(() {
      final idx = _tasks.indexWhere((t) => t.id == task.id);
      if (idx != -1) {
        _tasks[idx] = task.copyWith(
          dueDate: newDate,
          clearDueDate: newDate == null,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hPadding = width < 360 ? 12.0 : 16.0;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Header(
                    pendingCount: _pending.length,
                    isDark: widget.isDark,
                    onToggleTheme: widget.onToggleTheme,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: TaskInput(onAdd: _addTask),
                        ),
                      ),
                    ),
                  ),
                  TaskSection(
                    title: 'Pending',
                    tasks: _pending,
                    emptyIcon: Icons.inbox_outlined,
                    emptyTitle: _tasks.isEmpty
                        ? 'Let\'s plan your day'
                        : 'All caught up',
                    emptySubtitle: _tasks.isEmpty
                        ? 'Add your first task above.'
                        : 'You have no pending tasks.',
                    onToggle: _toggleTask,
                    onDelete: _deleteTask,
                    onDueDateChanged: _updateDueDate,
                  ),
                  TaskSection(
                    title: 'Completed',
                    tasks: _completed,
                    emptyIcon: Icons.flag_outlined,
                    emptyTitle: 'Nothing completed yet',
                    emptySubtitle: 'Complete a task to see it here.',
                    onToggle: _toggleTask,
                    onDelete: _deleteTask,
                    onDueDateChanged: _updateDueDate,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final int pendingCount;
  final bool isDark;
  final VoidCallback onToggleTheme;
  const _Header({
    required this.pendingCount,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primary, AppTheme.primaryDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Dayora',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: Colors.white),
                ),
              ),
              IconButton(
                icon: Icon(
                  isDark ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
                onPressed: onToggleTheme,
                tooltip: 'Toggle theme',
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Your Day, Beautifully Organized.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$pendingCount pending',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
