# PRD — Dayora

## 1. Product Vision & Overview
Dayora ("Your Day, Beautifully Organized.") is a modern mobile To-Do List application built with Flutter, Dart, and Material Design 3. It helps users capture, track, complete, and remove daily tasks through a clean, distinctive, production-quality interface.

## 2. Problem Statement
The starter Flutter project provides only a counter demo, not a usable task manager. Dayora delivers a focused, visually polished task manager that makes daily task management simple and satisfying.

## 3. Product Objectives
- Provide reliable core task management (add, complete/uncomplete, delete).
- Separate pending and completed tasks clearly.
- Deliver a distinctive, cohesive, modern UI.
- Keep implementation realistic for the 04:00 PM, 4 November 2026 deadline.

## 4. Target Users
- Individuals organizing daily personal or work tasks.
- Internship reviewers evaluating UI/UX quality and functionality.

## 5. Confirmed Management Requirements (Mandatory)
1. Clean, modern mobile application interface.
2. Home screen with application name and header.
3. Task input field.
4. Add new tasks.
5. Display tasks in a list.
6. Mark tasks as completed.
7. Delete tasks.
8. Display pending and completed tasks separately.
9. Responsive, user-friendly interface.
10. Clean, structured, functional implementation.

## 6. Functional Requirements
- FR-1 Home screen displays app name "Dayora" and header.
- FR-2 Task input field accepts text.
- FR-3 Add button creates a task from non-empty input.
- FR-4 Empty/whitespace input is prevented.
- FR-5 Tasks display in a list under Pending.
- FR-6 Checkbox toggles completion; task moves to Completed.
- FR-7 Toggling again returns task to Pending (uncomplete).
- FR-8 Delete removes a task from its section.
- FR-9 Pending and Completed sections render separately with counts.
- FR-10 Empty states shown per section.

## 7. New Requirements (Enhancement Phase)

### 7.1 Task Due Dates (Optional Enhancement)
- FR-11 Optional due date selectable at task creation.
- FR-12 Due date displayed on task card.
- FR-13 Edit a task's due date.
- FR-14 Remaining days calculated from current local date.
- FR-15 Labels: Today, Tomorrow, X days remaining, Overdue by X days.
- FR-16 Completed tasks and overdue tasks handled correctly.
- FR-17 Prevent invalid date calculations/UI errors.

### 7.2 Dark and Light Themes (Optional Enhancement)
- FR-18 Light and dark themes.
- FR-19 Accessible theme toggle.
- FR-20 Centralized Material 3 theme configuration.
- FR-21 All UI adapts to selected theme.
- FR-22 Document persistence decision (default: in-memory only for now; persistence optional).

## 8. Non-Functional Requirements
- Material Design 3.
- Responsive across common mobile widths (320–430px+).
- Readable typography and sufficient contrast.
- Smooth, purposeful animations.
- No external runtime dependencies beyond Flutter SDK + cupertino_icons.
- Maintainable, well-structured code.

## 9. User Stories
- As a user, I can type a task and add it with one tap or Enter.
- As a user, I can see pending tasks at a glance.
- As a user, I can mark a task complete and see it move to Completed.
- As a user, I can uncomplete a task.
- As a user, I can delete a task.
- As a user, I see helpful empty states.
- (Enhancement) As a user, I can set/edit a due date and see remaining days.
- (Enhancement) As a user, I can toggle light/dark theme.

## 10. Acceptance Criteria
- AC-1 App launches to Home screen titled "Dayora".
- AC-2 Non-empty input + Add creates a task in Pending with unique id.
- AC-3 Empty/whitespace submit is prevented (button disabled or ignored).
- AC-4 Checkbox marks task completed; task relocates to Completed.
- AC-5 Checkbox again uncompletes; task returns to Pending.
- AC-6 Delete removes task and updates counts.
- AC-7 Pending and Completed sections separate with correct counts.
- AC-8 Empty state shown when a section has no tasks.
- AC-9 No crashes on common interactions.
- AC-10 Responsive layout without overflow on small screens.
- (Enhancement) AC-11 Due date selection and edit works; labels correct.
- (Enhancement) AC-12 Theme toggle switches light/dark; all UI adapts.

## 11. Scope
In scope (mandatory): requirements FR-1..FR-10. Optional enhancements: FR-11..FR-22.

## 12. Out of Scope
Backend, auth, cloud sync, notifications, deadlines beyond due date, priorities, categories, search, persistence/DB (unless approved), multi-user. Not mandatory.

## 13. Technical Constraints
- Flutter + Dart + Material Design 3.
- No new dependencies.
- Do not modify main.dart or pubspec.yaml per task instructions (unless approved).
- In-memory storage only (persistence optional).

## 14. Assumptions
- No persistence required for Day 01.
- Single screen app.
- Optional enhancements only if time allows.
- Theme selection persists only if persistence is implemented; otherwise resets on restart.

## 15. Submission Requirements
- Five documentation files in project root.
- Working Flutter app demonstrating mandatory features.
- Clean structured code.
- Screenshots/demo for submission.