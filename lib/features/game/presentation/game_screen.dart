// lib/features/game/presentation/game_screen.dart
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final gameState = Provider.of<GameState>(context);
          gameState.initializeGame(constraints.biggest);

          return Stack(
            children: [
              _buildBackground(),
              ..._buildMovingButtons(gameState),
              _buildGameControls(context, gameState),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildMovingButtons(GameState gameState) {
    return gameState.buttonPositions.asMap().entries.map((entry) {
      final index = entry.key;
      return MovingButton(
        position: entry.value,
        onPressed: () => gameState.handleButtonPress(index),
      );
    }).toList();
  }

  Widget _buildGameControls(BuildContext context, GameState gameState) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          ScoreDisplay(score: gameState.score),
          DifficultySelector(
            difficulty: gameState.difficulty,
            onChanged: (value) => gameState.updateDifficulty(value),
          ),
        ],
      ),
    );
  }
}