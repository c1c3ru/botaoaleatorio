// Adicione no AudioService
Future<void> playCelebration() async {
  await _player.setAsset(AssetsConstants.successSound);
  await _player.seek(Duration.zero);
  await _player.play();
}

// No GameState quando o jogo termina
void _endGame() {
  _isGameActive = false;
  _gameTimer?.cancel();
  if (_score > _highScore) {
    _playCelebration();
  }
}

void _playCelebration() async {
  final settings = await _repository.loadSettings();
  if (settings.soundEnabled) {
    AudioService().playCelebration();
  }
  // Mostrar animação de celebração
}