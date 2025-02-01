// lib/core/utils/position_generator.dart
import 'dart:math';
import 'package:flutter/material.dart';

import '../../constants/assets_constants.dart';



class PositionGenerator {
  static Offset generateRandomPosition(Size screenSize, double buttonSize) {
    final random = Random();
    return Offset(
      random.nextDouble() * (screenSize.width - buttonSize),
      random.nextDouble() * (screenSize.height - buttonSize),
    );
  }

  static Offset generateDynamicPosition(Offset currentPos, int difficulty, Size screenSize) {
    final random = Random();
    final speed = difficulty * 2.5;
    return Offset(
      (currentPos.dx + random.nextDouble() * speed - speed/2)
          .clamp(0.0, screenSize.width - AssetsConstants.buttonSize),
      (currentPos.dy + random.nextDouble() * speed - speed/2)
          .clamp(0.0, screenSize.height - AssetsConstants.buttonSize),
    );
  }
}