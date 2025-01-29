// lib/features/game/presentation/widgets/celebration_animation.dart
class CelebrationAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetsConstants.celebration1,
      repeat: false,
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}