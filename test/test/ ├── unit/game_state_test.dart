// test/unit/game_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:evading_game/data/repositories/settings_repository.dart';
import 'package:evading_game/features/game/presentation/game_state.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  group('GameState Tests', () {
    late GameState gameState;
    late MockSettingsRepository mockRepository;

    setUp(() {
      mockRepository = MockSettingsRepository();
      gameState = GameState(mockRepository, GameLogic());
    });

    test('Initial values are correct', () {
      expect(gameState.score, 0);
      expect(gameState.difficulty, 1);
    });
  });
}