# Aivora project memory

Last updated: September 23, 2026

## Product decision

Aivora is a polished Flutter mobile application that teaches people which AI model or platform to use and how to write better prompts. The user asked Codex to make all product and design decisions without asking further questions.

## Hard boundaries

- Aivora was created as a completely new project.
- Do not access, reuse, or modify files from the user's other projects.
- Work only inside the `Aivora` project when continuing this product.
- No login or account system.
- No backend, API key, analytics, or tracking.
- The core application must work offline.
- Support Android and iOS Flutter source.

## Current experience

1. **Start** — the user chooses what they want to achieve.
2. **Models** — searchable and filterable AI model catalog with detailed profiles.
3. **Platforms** — AI platform directory with free/paid indicators and an AI/ML explanation.
4. **Prompt Lab** — converts any problem into a structured professional prompt locally.

## Content

- English and Arabic with proper RTL/LTR switching.
- 13 curated AI model families across chat, reasoning, research, code, images, video, audio, and open models.
- 12 consumer and developer platforms.
- 8 problem categories with examples.
- Every model profile explains benefits, best uses, access, risks, and prompting advice.
- The application reminds users to verify changing prices, availability, important facts, and high-stakes advice.

## Visual direction

The original cold blue palette was rejected. The approved direction is **Magic Ember**:

- Deep midnight-plum backgrounds.
- Glowing orange as the primary color.
- Warm gold for highlights.
- Magenta and controlled violet for magical depth.
- High contrast, rounded cards, subtle glows, and rich gradients.
- Avoid returning to a blue-dominant design.

The central color definitions are in `lib/core/app_theme.dart`.

## Architecture

- `lib/app.dart` — application root and language state.
- `lib/core/` — theme and localization primitives.
- `lib/domain/` — catalog data types.
- `lib/data/catalog.dart` — model, platform, category, and goal content.
- `lib/screens/` — the four sections and model detail screen.
- `lib/widgets/common.dart` — shared brand and layout components.
- `test/app_test.dart` — portrait, Arabic, landscape, and offline prompt tests.

## Verification status

- `flutter analyze`: no issues after the Magic Ember color update.
- Four widget tests pass in an isolated build workspace.
- Tests cover portrait launch, Arabic switching, responsive landscape layout, and offline prompt generation.
- The Magic Ember Android release APK built successfully after the color update.
- The project is stored under OneDrive, which can temporarily lock Flutter build cache folders. If that happens, copy only Aivora into a temporary non-OneDrive folder for testing/building, then copy the APK back to `release/aivora-1.0.0.apk`.

## Release artifact

Android release location:

`release/aivora-1.0.0.apk`

When making visual or functional changes, rerun:

```sh
flutter analyze
flutter test
flutter build apk --release
```
