// lib/data/models/game_settings.dart
class GameSettings {
  final bool soundEnabled;
  final bool vibrationEnabled;
  final int difficultyLevel;

  GameSettings({
    required this.soundEnabled,
    required this.vibrationEnabled,
    required this.difficultyLevel,
  });
}