// lib/features/game/presentation/widgets/moving_button.dart
import 'package:flutter/material.dart';

class MovingButton extends StatelessWidget {
  final Offset position;
  final VoidCallback onMove;

  const MovingButton({
    super.key,
    required this.position,
    required this.onMove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => onMove(),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}