import 'package:hive/hive.dart';
import '../models/settings_model.dart';

class SettingsRepository {
  late Box<SettingsModel> _settingsBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SettingsModelAdapter());
    }
    _settingsBox = await Hive.openBox<SettingsModel>('settings');
  }

  SettingsModel getSettings() {
    return _settingsBox.get('current', defaultValue: SettingsModel(difficulty: 1))!;
  }

  Future<void> saveSettings(SettingsModel settings) async {
    await _settingsBox.put('current', settings);
  }
}