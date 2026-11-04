# RULES — Dayora

## 1. Dart Naming
Files snake_case; classes PascalCase; variables/methods camelCase; constants lowerCamelCase (k prefix optional).

## 2. Widget Composition
- One reusable widget per file.
- Small build methods; extract widgets.
- Use ListView.builder for lists.

## 3. Separation of Concerns
- Models hold data only.
- State logic in HomeScreen state methods.
- Theme in dedicated file.
- No business logic in build.

## 4. State Management
- StatefulWidget + setState only.
- No external state packages.
- Mutate list only via HomeScreen methods.
- Pass data/callbacks via constructors.

## 5. Theme & Design Tokens
- Use theme colors/text styles; no hardcoded colors in widgets.
- Spacing scale 4/8/12/16/24.
- Material 3 components.

## 6. Responsive Layout
- Avoid overflow; use Flexible/Expanded.
- Respect text scaling.
- Padding adapts to screen width.

## 7. Accessibility
- 48x48 touch targets.
- Semantic labels on icon buttons.
- Contrast ≥4.5:1 for body text (verify, don't claim blindly).

## 8. Input Validation
- Prevent empty/whitespace submission.
- Trim input.

## 9. Error Handling
- Validate input; disable submit when invalid.
- No silent failures.

## 10. Formatting & Linting
- Follow flutter_lints; `flutter analyze` clean.
- Use const constructors where possible.
- Prefer immutable data with copyWith.

## 11. Testing
- Widget tests for add/complete/delete flows (if time).
- Run `flutter test` before submission.

## 12. Dependencies
- No new packages without approval. Only Flutter SDK + cupertino_icons + flutter_test + flutter_lints.

## 13. Git Practices
- Small commits with clear messages.
- Do not commit generated files.

## 14. Security & Privacy
- No PII; in-memory only; no network calls.

## 15. No Unnecessary Refactoring / Features
- Do not modify main.dart or pubspec.yaml per task.
- Do not implement unrequested mandatory features.
- Do not refactor working code unnecessarily.

## 16. Enhancement Rules (Due Dates & Themes)
- Date calculations use date-only (strip time) to avoid invalid labels.
- Theme toggle must not break existing UI.
- No new dependencies for theming.