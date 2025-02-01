// test/unit/game_state_test.dart
import 'package:evading_button_game/data/models/settings_model.dart';
import 'package:evading_button_game/data/repositories/settings_repository.dart';
import 'package:evading_button_game/features/game/bloc/game_state.dart';
import 'package:evading_button_game/features/game/domain/game_logic.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {
  @override
  SettingsModel getSettings() {
    // TODO: implement getSettings
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> saveSettings(SettingsModel settings) {
    // TODO: implement saveSettings
    throw UnimplementedError();
  }
}

class Mock {}

void main() {
  group('GameState Tests', () {
    late GameState gameState;
    late MockSettingsRepository mockRepository;

    setUp(() {
      mockRepository = MockSettingsRepository();
      gameState = GameState(mockRepository, GameLogic(),
          buttonPositions: [], score: null, difficulty: null, screenSize: null);
    });

    test('Initial values are correct', () {
      expect(gameState.score, 0);
      expect(gameState.difficulty, 1);
    });
  });
}
