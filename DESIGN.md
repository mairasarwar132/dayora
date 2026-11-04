# DESIGN — Dayora

## 1. Brand Identity
Name: Dayora. Tagline: "Your Day, Beautifully Organized." Personality: modern, elegant, calm, focused, friendly, premium yet practical. Productivity-first, not decorative.

## 2. Visual Design System — Aurora Indigo (Final Palette)
- Primary: #4F46E5
- Primary Deep: #3730A3
- Primary Container: #E0E7FF
- Accent: #14B8A6
- Background: #F5F7FB
- Surface: #FFFFFF
- Surface Muted: #EEF1F7
- Text Primary: #0F172A
- Text Secondary: #64748B
- Border: #E2E8F0
- Completed/Success: #14B8A6
- Destructive: #EF4444
Dark mode (optional): Background #0B1020, Surface #151B2E, Text #E6EAF2.

Typography: system font. Sizes: Display 28/700, Section 16/600, Task 16/500, Body 14/400, Caption 12/400. Line heights ~1.3–1.5.
Spacing: 4/8/12/16/24. Radii: card 16, button 12, input 14. Elevation: subtle shadow on floating input card only. Icons: Material rounded. Touch targets: ≥48dp.

## 3. Home Screen Specification (top to bottom)
1. SafeArea top.
2. Gradient header (Primary→Primary Deep): app name "Dayora" (display), tagline, pending count chip.
3. Floating input card overlapping header bottom (rounded 16, shadow, padding 12).
4. Pending section: header "Pending (n)" + list or empty state.
5. Completed section: header "Completed (n)" + list or empty state.
6. Bottom safe-area padding + 16 spacing.
Scrolling: single SingleChildScrollView or CustomScrollView. No horizontal scroll.

## 4. Task Input
- Field height ~48, radius 14, filled Surface Muted, hint "Add a new task...".
- Focus: border Primary, subtle glow.
- Padding 12 horizontal.
- Add button: circular filled Primary, icon add, 44dp min; disabled (muted) when input empty.
- Empty validation: trim; disable submit.
- Keyboard: Enter submits.
- After add: clear field, refocus, animate insert.

## 5. Task Cards
- Structure: Surface card, radius 16, padding 12, border 1px Border, no heavy shadow.
- Leading: rounded Checkbox (Primary when checked).
- Title: 16/500; completed → strikethrough, Text Secondary.
- Trailing: delete IconButton (Destructive on hover/press).
- Spacing: 8 between cards.
- States: normal, pressed (slight scale 0.98), completed (muted + strikethrough).
- Animation: 200ms ease-in-out on status change and insert/remove.

## 6. Empty States
- No tasks at all: icon (checklist), "Let's plan your day", "Add your first task above."
- No pending: icon (inbox), "All caught up", "You have no pending tasks."
- No completed: icon (flag), "Nothing completed yet", "Complete a task to see it here."
Centered, muted icon, title 16/600, subtitle 14 secondary.

## 7. Motion & Interaction
- Add: 200ms slide+fade insert.
- Complete/move: 250ms animated relocation.
- Delete: 200ms slide-out + fade.
- Empty-state: 150ms fade.
- Avoid excessive motion; respect reduced motion if possible.

## 8. Responsive Design
- Small (≤360): padding 12, font scale respected.
- Standard (360–430): padding 16.
- Large/tablet: center content max width 600.
- Prevent overflow/clipping; use Flexible/Expanded.

## 9. Design Quality Checklist
- [ ] Consistent spacing
- [ ] No overflow on small screens
- [ ] Empty states present
- [ ] Clear pending/completed states
- [ ] Smooth animations
- [ ] Readable text & contrast
- [ ] Touch-friendly targets
- [ ] Cohesive palette
- [ ] Matches Aurora Indigo palette
- [ ] Header + floating input card present

## 10. Enhancement Design (Due Dates & Themes)
Due dates: date chip on card with calendar icon; colors: overdue destructive, today primary, future secondary. Completed tasks do not show overdue. Theme toggle: icon button in header (sun/moon), accessible. Dark theme uses defined dark palette; all surfaces/text adapt. Progress indicator is a planned UI enhancement, not mandatory.