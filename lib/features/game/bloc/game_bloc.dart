import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:evading_button_game/data/models/settings_model.dart';
import 'package:evading_button_game/data/repositories/settings_repository.dart';
import 'package:evading_button_game/features/game/domain/game_logic.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final SettingsRepository _settingsRepository;
  final GameLogic _gameLogic;
  final Random _random = Random();

  GameBloc(this._settingsRepository, this._gameLogic)
      : super(const GameState(
          buttonPositions: [],
          score: 0,
          difficulty: 1,
          screenSize: Size.zero,
        )) {
    on<InitializeGame>(_onInitializeGame);
    on<UpdateButtonPosition>(_onUpdateButtonPosition);
    on<UpdateDifficulty>(_onUpdateDifficulty);
    on<AddScore>(_onAddScore);
  }

  void _onInitializeGame(InitializeGame event, Emitter<GameState> emit) async {
    final settings = _settingsRepository.getSettings();
    final positions = _gameLogic.generateInitialPositions(
      count: 5,
      screenSize: event.screenSize,
    );

    emit(state.copyWith(
      buttonPositions: positions,
      difficulty: settings.difficulty,
      screenSize: event.screenSize,
    ));
  }

  void _onUpdateButtonPosition(
      UpdateButtonPosition event, Emitter<GameState> emit) {
    final newPositions = List<Offset>.from(state.buttonPositions);
    newPositions[event.buttonIndex] = Offset(
      _random.nextDouble() * state.screenSize.width,
      _random.nextDouble() * state.screenSize.height,
    );

    emit(state.copyWith(buttonPositions: newPositions));
  }

  void _onUpdateDifficulty(UpdateDifficulty event, Emitter<GameState> emit) {
    final newDifficulty = event.newDifficulty.clamp(1, 5);
    _settingsRepository.saveSettings(SettingsModel(difficulty: newDifficulty));
    emit(state.copyWith(difficulty: newDifficulty));
  }

  void _onAddScore(AddScore event, Emitter<GameState> emit) {
    final newScore = state.score +
        _gameLogic.calculateScore(
          baseScore: 100,
          difficulty: state.difficulty,
        );
    emit(state.copyWith(score: newScore));
  }
}
