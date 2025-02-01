import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/game_bloc.dart';
import '../../bloc/game_event.dart';
import '../../bloc/game_state.dart';

class DifficultySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return PopupMenuButton<int>(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 1, child: Text('Fácil')),
            const PopupMenuItem(value: 2, child: Text('Médio')),
            const PopupMenuItem(value: 3, child: Text('Difícil')),
          ],
          onSelected: (value) {
            context.read<GameBloc>().add(UpdateDifficulty(value));
          },
        );
      },
    );
  }
}
