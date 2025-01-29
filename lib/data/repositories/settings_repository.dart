// lib/data/repositories/settings_repository.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_settings.dart';

class SettingsRepository {
  static const _prefix = 'settings_';

  Future<GameSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return GameSettings(
      soundEnabled: prefs.getBool(_prefix + 'sound') ?? true,
      vibrationEnabled: prefs.getBool(_prefix + 'vibration') ?? true,
      difficultyLevel: prefs.getInt(_prefix + 'difficulty') ?? 1,
    );
  }

  Future<void> saveSettings(GameSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefix + 'sound', settings.soundEnabled);
    await prefs.setBool(_prefix + 'vibration', settings.vibrationEnabled);
    await prefs.setInt(_prefix + 'difficulty', settings.difficultyLevel);
  }
}