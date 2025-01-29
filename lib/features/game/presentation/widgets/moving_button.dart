// lib/features/game/presentation/widgets/moving_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MovingButton extends HookWidget {
  final Offset position;
  final VoidCallback onPressed;

  const MovingButton({
    required this.position,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}