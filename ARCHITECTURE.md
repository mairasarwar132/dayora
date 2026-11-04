# ARCHITECTURE — Dayora

## 1. Overview
Simple, layered Flutter architecture: Presentation (widgets) + State (HomeScreen StatefulWidget) + Model (Task). No external state packages, no repositories/services/DI.

## 2. Technology
Flutter, Dart, Material Design 3. Dependencies: Flutter SDK + cupertino_icons only.

## 3. Entry Point
`lib/main.dart` (existing, unchanged) runs `MyApp`. Recommended: `MyApp` builds MaterialApp with theme from `app_theme.dart` and home `HomeScreen`. (main.dart modification deferred; developer may wire after approval.)

## 4. Theme Structure
`lib/theme/app_theme.dart` exposes `AppTheme.light()` returning ThemeData with ColorScheme from Aurora Indigo palette, text styles, component themes.

## 5. Task Model
`lib/models/task.dart`
```dart
class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;
  Task copyWith({String? title, bool? isCompleted});
}
```

## 6. Folder Structure
```
lib/
  main.dart
  app.dart (optional)
  models/task.dart
  screens/home_screen.dart
  widgets/task_input.dart
  widgets/task_card.dart
  widgets/task_section.dart
  widgets/empty_state.dart
  theme/app_theme.dart
```

## 7. Home Screen Responsibilities
Scaffold, gradient header, floating input card, pending section, completed section, state (List<Task>), methods addTask/toggleTask/deleteTask, filtering pending/completed.

## 8. Components
- `task_input.dart`: TextField + Add button; validation; calls onAdd.
- `task_card.dart`: checkbox, title, delete; visual states; calls onToggle/onDelete.
- `task_section.dart`: header + count + list or empty state.
- `empty_state.dart`: icon + title + subtitle.

## 9. State Management Decision
StatefulWidget + setState only. No ChangeNotifier. Task model separate. Widgets communicate via constructor params/callbacks.

## 10. State Update Flow
Input submit → HomeScreen.addTask(title) → setState adds Task → rebuild → Pending section updates. Toggle → setState flips isCompleted → task moves section. Delete → remove → rebuild.

## 11. Task Flows
- Create: validate non-empty → generate id (uuid-like via DateTime) → add to list.
- Complete: toggle isCompleted true → moves to Completed.
- Uncomplete: toggle false → returns to Pending.
- Delete: remove by id.

## 12. Error Handling
- Empty input prevented (button disabled).
- No backend errors.

## 13. Maintainability
- Small widgets, single responsibility.
- Design tokens in theme.
- Easy to add persistence later without UI changes.

## 14. Enhancement Architecture (Due Dates)
- Task model adds `DateTime? dueDate`.
- Store optional due date.
- Compare date-only local calendar values (strip time).
- Labels: Today, Tomorrow, X days remaining, Overdue by X days.
- Completed tasks do not display overdue warnings.
- Allow selecting, editing, and clearing optional due date.

## 15. Enhancement Architecture (Themes)
- `AppTheme.light()` and `AppTheme.dark()`.
- MyApp owns theme state (ThemeMode).
- MaterialApp uses theme, darkTheme, themeMode.
- HomeScreen only triggers theme changes via callback.
- All widgets use theme-aware colors (Theme.of(context)) rather than hardcoded light-only colors.
- Optional persistence via SharedPreferences only if approved (default in-memory).