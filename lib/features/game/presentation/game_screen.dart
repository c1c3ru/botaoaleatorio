import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/settings_repository.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';
import '../domain/game_logic.dart';
import 'widgets/moving_button.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocProvider(
            create: (context) => GameBloc(
              context.read<SettingsRepository>(),
              GameLogic(),
            )..add(InitializeGame(constraints.biggest)),
            child: BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    _buildBackground(),
                    ..._buildMovingButtons(context),
                    _buildGameControls(context, state),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildMovingButtons(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    return state.buttonPositions.asMap().entries.map((entry) {
      return MovingButton(
        position: entry.value,
        onMove: () => context.read<GameBloc>().add(UpdateButtonPosition(entry.key)),
      );
    }).toList();
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildGameControls(BuildContext context, GameState state) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text('Score: ${state.score}'),
          _DifficultySlider(
            currentDifficulty: state.difficulty.toDouble(),
            onChanged: (value) => context.read<GameBloc>().add(UpdateDifficulty(value.toInt())),
          ),
          ElevatedButton(
            onPressed: () => context.read<GameBloc>().add(AddScore()),
            child: const Text('Add Score'),
          ),
        ],
      ),
    );
  }
}

class _DifficultySlider extends StatelessWidget {
  final double currentDifficulty;
  final ValueChanged<double> onChanged;

  const _DifficultySlider({
    required this.currentDifficulty,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentDifficulty,
      min: 1,
      max: 5,
      divisions: 4,
      label: 'Nível ${currentDifficulty.toInt()}',
      onChanged: onChanged,
    );
  }
}