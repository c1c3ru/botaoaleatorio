// lib/core/services/vibration_service.dart
import 'package:vibration/vibration.dart';

class VibrationService {
  Future<void> vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100);
    }
  }
}