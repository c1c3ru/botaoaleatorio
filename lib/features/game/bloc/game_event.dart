import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class InitializeGame extends GameEvent {
  final Size screenSize;
  const InitializeGame(this.screenSize);

  @override
  List<Object> get props => [screenSize];
}

class UpdateButtonPosition extends GameEvent {
  final int buttonIndex;
  const UpdateButtonPosition(this.buttonIndex);

  @override
  List<Object> get props => [buttonIndex];
}

class UpdateDifficulty extends GameEvent {
  final int newDifficulty;
  const UpdateDifficulty(this.newDifficulty);

  @override
  List<Object> get props => [newDifficulty];
}

class AddScore extends GameEvent {}