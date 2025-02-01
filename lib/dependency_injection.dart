import 'package:get_it/get_it.dart';
import 'package:evading_button_game/data/repositories/settings_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  getIt.registerSingleton<SettingsRepository>(SettingsRepository());
  await getIt<SettingsRepository>().init();
}