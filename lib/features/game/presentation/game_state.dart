// lib/features/game/presentation/game_state.dart
import 'package:flutter/foundation.dart';
import '../../../data/repositories/settings_repository.dart';
import '../../domain/game_logic.dart';

// lib/features/game/presentation/game_state.dart
class GameState with ChangeNotifier {
  final SettingsRepository _repository;
  final GameLogic _logic;
  int _score = 0;
  int _difficulty = 1;

  GameState(this._repository, this._logic);

  late List<Offset> _buttonPositions;
  bool _isGameActive = false;
  Size _screenSize = Size.zero;

  void initializeGame(Size screenSize) {
    _screenSize = screenSize;
    _buttonPositions = _logic.generateInitialPositions(3, _screenSize);
    _startGame();
  }

  void _startGame() {
    _isGameActive = true;
    _gameTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_isGameActive) {
        _buttonPositions = _logic.updatePositions(
          _buttonPositions,
          _difficulty,
          _screenSize
        );
        notifyListeners();
      }
    });
  }

  void handleButtonPress(int index) {
    if (!_isGameActive) return;

    _buttonPositions[index] = PositionGenerator.generateRandomPosition(
      _screenSize,
      AppConstants.buttonSize,
    );

    updateScore(true);
    _playFeedback();
    notifyListeners();
  }

  void _playFeedback() async {
    final settings = await _repository.loadSettings();
    if (settings.soundEnabled) {
      AudioService().playSound(AssetsConstants.moveSound);
    }
    if (settings.vibrationEnabled) {
      VibrationService().vibrate();
    }
  }
Future<void> loadSettings() async {
    final settings = await _repository.loadSettings();
    _difficulty = settings.difficultyLevel;
    notifyListeners();
  }

  void updateScore(bool success) {
    _score += _logic.calculateScore(DateTime.now(), _difficulty);
    _difficulty = _logic.getNextDifficulty(_difficulty, success);
    notifyListeners();
  }

  // Getters
  int get score => _score;
  int get difficulty => _difficulty;


}