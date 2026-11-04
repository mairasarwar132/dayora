# PHASES — Dayora

Deadline: 04:00 PM, 4 November 2026. Mandatory requirements first; optional only after Phase 6.

## Phase 1 — Documentation (DONE)
- Objective: Finalize five docs.
- Tasks: Audit, refine, verify consistency.
- Deliverables: PRD, ARCHITECTURE, RULES, PHASES, DESIGN.
- Verify: All files exist; consistent.
- Dependencies: None.

## Phase 2 — Design Foundation
- Objective: Theme and design tokens.
- Tasks: app_theme.dart with Aurora Indigo palette and text styles.
- Deliverables: Theme file.
- Verify: App uses theme colors.
- Dependencies: Phase 1.

## Phase 3 — Screen & Components
- Objective: Home screen layout and reusable widgets.
- Tasks: home_screen, task_input, task_card, task_section, empty_state.
- Deliverables: Static UI.
- Verify: Layout matches DESIGN.md; no overflow.
- Dependencies: Phase 2.

## Phase 4 — Task Model & State
- Objective: Data model and state.
- Tasks: Task model; HomeScreen state; add/toggle/delete methods.
- Deliverables: In-memory task management.
- Verify: State updates reflect in UI.
- Dependencies: Phase 3.

## Phase 5 — Add/Delete/Completion
- Objective: Core functionality.
- Tasks: Input validation, add, checkbox toggle, delete.
- Deliverables: Working interactions.
- Verify: AC-2..AC-6.
- Dependencies: Phase 4.

## Phase 6 — Pending/Completed Separation & Empty States
- Objective: Separate sections + empty states.
- Tasks: Filtering, counts, empty_state usage.
- Deliverables: Two sections.
- Verify: AC-7, AC-8.
- Dependencies: Phase 5.

## Phase 7 — Responsive & Polish
- Objective: Responsiveness and animations.
- Tasks: Breakpoints, motion, touch targets.
- Deliverables: Polished UI.
- Verify: AC-10; smooth performance.
- Dependencies: Phase 6.

## Phase 8 — Testing & Regression
- Objective: Analyze and test.
- Tasks: flutter analyze, flutter test, smoke test.
- Deliverables: Clean analysis.
- Verify: No errors.
- Dependencies: Phase 7.

## Phase 9 — Due Dates (Enhancement)
- Objective: Add optional due dates.
- Tasks: model field, date picker, label calc, card display, edit/clear.
- Deliverables: Due date feature.
- Verify: labels correct; no invalid dates; completed not overdue.
- Dependencies: Phase 8.

## Phase 10 — Theme Switching (Enhancement)
- Objective: Light/dark themes + toggle.
- Tasks: dark theme, toggle callback, adapt UI, theme-aware colors.
- Deliverables: Theme switching.
- Verify: UI adapts; contrast ok.
- Dependencies: Phase 9.

## Phase 11 — UI Polish (Enhancement)
- Objective: Polish dashboard and visuals.
- Tasks: progress indicator (planned, not mandatory), spacing, animations.
- Deliverables: Polished UI.
- Verify: Visual quality.
- Dependencies: Phase 10.

## Phase 12 — Regression Testing
- Objective: Final testing.
- Tasks: analyze, test, smoke.
- Deliverables: Clean results.
- Verify: No errors.
- Dependencies: Phase 11.

## Phase 13 — Final Submission
- Objective: Demo and submit.
- Tasks: Screenshots/demo, package.
- Deliverables: Submission.
- Verify: Mandatory features demonstrable.
- Dependencies: Phase 12.