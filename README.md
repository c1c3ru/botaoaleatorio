# botaoaleatorio

A new Flutter project.

## Getting Started

## Organização do projeto:
```
    lib/
    ├── core/
    │   ├── constants/
    │   │   ├── app_constants.dart
    │   │   └── assets_constants.dart
    │   ├── services/
    │   │   ├── audio_service.dart
    │   │   └── vibration_service.dart
    │   └── utils/
    │       └── position_generator.dart
    ├── data/
    │   ├── models/
    │   │   └── game_settings.dart
    │   └── repositories/
    │       └── settings_repository.dart
    ├── features/
    │   └── game/
    │       ├── presentation/
    │       │   ├── widgets/
    │       │   │   ├── celebration_animation.dart
    │       │   │   ├── difficulty_selector.dart
    │       │   │   ├── moving_button.dart
    │       │   │   ├── score_display.dart
    │       │   │   └── static_button.dart
    │       │   ├── game_screen.dart
    │       │   └── game_state.dart
    │       └── domain/
    │           └── game_logic.dart
    ├── app.dart
    └── main.dart
```

```
assets/
├── animations/
│   ├── celebration1.json
│   ├── celebration2.json
│   └── celebration3.json
├── sounds/
│   ├── success.mp3
│   └── move.mp3
└── icons/
    ├── evading_icon.png
    └── celebration_icon.png
```

```
test/
├── unit/
│   ├── game_state_test.dart
│   └── audio_service_test.dart
└── widget/
    ├── game_screen_test.dart
    └── moving_button_test.dart
```
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
