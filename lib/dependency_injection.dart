import 'package:get_it/get_it.dart';
import 'package:evading_button_game/data/repositories/settings_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Registra o SettingsRepository como um singleton
  getIt.registerSingleton<SettingsRepository>(SettingsRepository());
  await getIt<SettingsRepository>().init(); // Inicializa o repositório
}
