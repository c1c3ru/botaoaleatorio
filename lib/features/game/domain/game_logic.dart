// lib/features/game/domain/game_logic.dart
class GameLogic {
  // ... (métodos existentes)

  List<Offset> generateInitialPositions(int count, Size screenSize) {
    return List.generate(count, (_) => PositionGenerator.generateRandomPosition(
      screenSize,
      AppConstants.buttonSize,
    ));
  }

  List<Offset> updatePositions(List<Offset> currentPositions, int difficulty, Size screenSize) {
    return currentPositions.map((pos) =>
      PositionGenerator.generateDynamicPosition(pos, difficulty, screenSize)
    ).toList();
  }
}