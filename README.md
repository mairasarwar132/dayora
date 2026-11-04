# Dayora

**Your Day, Beautifully Organized.**

Dayora is a modern Flutter task management application built with Material Design 3. It helps users capture, organize, complete, and remove daily tasks through a clean, distinctive Aurora Indigo interface with optional due dates and light/dark theme switching.

Repository: https://github.com/mairasarwar132/dayora

## Project Overview

Dayora replaces the default Flutter starter counter app with a focused, polished task manager. It was developed as the Day 01 assignment for the Hunters Group Mobile App Development Internship. The project prioritizes both reliable functionality and high-quality UI/UX while keeping the architecture lightweight and maintainable.

## Screenshots

### Home Screen
![Home Screen](screenshots/01-home-screen.jpeg)

### Pending Tasks
![Pending Tasks](screenshots/02-pending-tasks.jpeg)

### Completed Tasks
![Completed Tasks](screenshots/03-completed-tasks.jpeg)

### Dark Mode
![Dark Mode](screenshots/04-dark-mode.jpeg)

## Features

Verified features in the current implementation:

- Add tasks with validation for empty or whitespace-only input.
- Separate pending and completed tasks into distinct sections.
- Display accurate pending and completed task counters.
- Mark tasks as completed or move completed tasks back to pending.
- Delete tasks.
- Optional due dates during task creation.
- Edit or clear an existing due date.
- Due-date status labels: Today, Tomorrow, X days remaining, Overdue by X days.
- Completed tasks never display overdue warnings.
- Light and dark theme switching through an accessible header toggle.
- Responsive, mobile-first layout with safe areas.
- Empty states for no tasks, no pending tasks, and no completed tasks.
- Subtle animations and accessible touch targets.

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter 3.38.6 | Cross-platform UI framework |
| Dart 3.10.7 | Programming language |
| Material Design 3 | Design system and components |
| StatefulWidget + setState | Local state management |

No third-party runtime dependencies are used beyond the Flutter SDK and `cupertino_icons`.

## Project Architecture

```text
lib/
  main.dart
  models/
    task.dart
  screens/
    home_screen.dart
  theme/
    app_theme.dart
  utils/
    date_labels.dart
  widgets/
    empty_state.dart
    task_card.dart
    task_input.dart
    task_section.dart
test/
  widget_test.dart
```

Key responsibilities:

- `main.dart` owns theme state and configures `MaterialApp` with `theme`, `darkTheme`, and `themeMode`.
- `models/task.dart` defines the immutable `Task` model with optional `dueDate`.
- `screens/home_screen.dart` manages task state and coordinates add, toggle, delete, and due-date updates.
- `theme/app_theme.dart` provides light and dark Material 3 themes.
- `utils/date_labels.dart` calculates date-only due-date labels.
- `widgets/task_input.dart` handles task entry, optional date selection, and validation.
- `widgets/task_card.dart` renders task rows, due-date chips, edit, and delete controls.
- `widgets/task_section.dart` renders section headers, counts, lists, and empty states.
- `widgets/empty_state.dart` renders centered empty-state content.

## Getting Started

### Prerequisites

- Flutter (stable channel)
- Dart SDK
- Chrome or an Android device/emulator

### Setup

```bash
git clone https://github.com/mairasarwar132/dayora.git
cd dayora
flutter pub get
```

### Run

```bash
flutter run
```

Or explicitly on Chrome:

```bash
flutter run -d chrome
```

## Running Tests

```bash
flutter analyze
flutter test
```

Verified results:
- `flutter analyze`: No issues found.
- `flutter test`: 17 tests passed.

Test coverage includes core task operations, due-date label logic, and Task model behavior.

## Building an APK

```bash
flutter build apk --release
```

The release APK is generated at:

`build/app/outputs/flutter-apk/app-release.apk`

## Current Limitations

- Tasks are stored in memory only and are not persisted after app restart.
- Theme selection is not persisted between app launches.
- Screenshots are JPEG files; no due-date screenshot is currently included.

## Project Documentation

- [PRD.md](PRD.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [RULES.md](RULES.md)
- [PHASES.DOC.MD](PHASES.DOC.MD)
- [DESIGN.md](DESIGN.md)

## Internship Context

Dayora was developed as a Day 01 assignment during the Hunters Group Mobile App Development Internship. It demonstrates Flutter UI/UX design, state management, testing, and documentation practices.

