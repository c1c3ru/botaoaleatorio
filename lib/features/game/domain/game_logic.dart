// lib/features/game/domain/game_logic.dart
import 'dart:math';
import 'package:flutter/material.dart';

class GameLogic {
  List<Offset> generateInitialPositions({
    required int count,
    required Size screenSize,
  }) {
    final random = Random();
    return List.generate(count, (_) => Offset(
      random.nextDouble() * screenSize.width,
      random.nextDouble() * screenSize.height,
    ));
  }

  int calculateScore({required int baseScore, required int difficulty}) {
    return baseScore * difficulty;
  }
}