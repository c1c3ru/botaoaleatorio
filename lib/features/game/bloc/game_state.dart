import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GameState extends Equatable {
  final List<Offset> buttonPositions;
  final int score;
  final int difficulty;
  final Size screenSize;

  const GameState({
    required this.buttonPositions,
    required this.score,
    required this.difficulty,
    required this.screenSize,
  });

  GameState copyWith({
    List<Offset>? buttonPositions,
    int? score,
    int? difficulty,
    Size? screenSize,
  }) {
    return GameState(
      buttonPositions: buttonPositions ?? this.buttonPositions,
      score: score ?? this.score,
      difficulty: difficulty ?? this.difficulty,
      screenSize: screenSize ?? this.screenSize,
    );
  }

  @override
  List<Object> get props => [buttonPositions, score, difficulty, screenSize];
}