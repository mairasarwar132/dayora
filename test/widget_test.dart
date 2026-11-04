import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';
import 'package:taskflow/models/task.dart';
import 'package:taskflow/utils/date_labels.dart';

void main() {
  testWidgets('add task', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Buy milk'), findsOneWidget);
  });

  testWidgets('empty prevented', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Buy milk'), findsNothing);
  });

  testWidgets('complete task', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField), 'Task A');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(find.text('Task A'), findsOneWidget);
  });

  testWidgets('uncomplete task', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField), 'Task B');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(find.text('Task B'), findsOneWidget);
  });

  testWidgets('delete task', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byType(TextField), 'Task C');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();
    expect(find.text('Task C'), findsNothing);
  });

  // Date labels
  test('no due date returns null', () {
    expect(dueDateLabel(null, false), isNull);
  });

  test('same date returns Today', () {
    final now = DateTime(2026, 1, 10);
    expect(dueDateLabel(DateTime(2026, 1, 10), false, now: now), 'Today');
  });

  test('next date returns Tomorrow', () {
    final now = DateTime(2026, 1, 10);
    expect(dueDateLabel(DateTime(2026, 1, 11), false, now: now), 'Tomorrow');
  });

  test('future date returns days remaining', () {
    final now = DateTime(2026, 1, 10);
    expect(
      dueDateLabel(DateTime(2026, 1, 13), false, now: now),
      '3 days remaining',
    );
  });

  test('past date returns overdue', () {
    final now = DateTime(2026, 1, 10);
    expect(
      dueDateLabel(DateTime(2026, 1, 7), false, now: now),
      'Overdue by 3 days',
    );
  });

  test('completed past-due has no overdue', () {
    final now = DateTime(2026, 1, 10);
    expect(dueDateLabel(DateTime(2026, 1, 7), true, now: now), isNull);
  });

  test('completed today returns Today', () {
    final now = DateTime(2026, 1, 10);
    expect(dueDateLabel(DateTime(2026, 1, 10), true, now: now), 'Today');
  });

  // Task model
  test('task with dueDate', () {
    final d = DateTime(2026, 2, 2);
    final t = Task(
      id: '1',
      title: 'T',
      createdAt: DateTime(2026, 1, 1),
      dueDate: d,
    );
    expect(t.dueDate, d);
  });

  test('copyWith preserves dueDate', () {
    final d = DateTime(2026, 2, 2);
    final t = Task(
      id: '1',
      title: 'T',
      createdAt: DateTime(2026, 1, 1),
      dueDate: d,
    );
    final t2 = t.copyWith(title: 'X');
    expect(t2.dueDate, d);
    expect(t2.title, 'X');
  });

  test('copyWith updates dueDate', () {
    final d = DateTime(2026, 2, 2);
    final d2 = DateTime(2026, 3, 3);
    final t = Task(
      id: '1',
      title: 'T',
      createdAt: DateTime(2026, 1, 1),
      dueDate: d,
    );
    final t2 = t.copyWith(dueDate: d2);
    expect(t2.dueDate, d2);
  });

  test('clearDueDate clears', () {
    final d = DateTime(2026, 2, 2);
    final t = Task(
      id: '1',
      title: 'T',
      createdAt: DateTime(2026, 1, 1),
      dueDate: d,
    );
    final t2 = t.copyWith(clearDueDate: true);
    expect(t2.dueDate, isNull);
  });

  test('completion preserves dueDate', () {
    final d = DateTime(2026, 2, 2);
    final t = Task(
      id: '1',
      title: 'T',
      createdAt: DateTime(2026, 1, 1),
      dueDate: d,
    );
    final t2 = t.copyWith(isCompleted: true);
    expect(t2.dueDate, d);
    expect(t2.isCompleted, true);
  });
}
