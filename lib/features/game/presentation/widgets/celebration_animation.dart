import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../../constants/assets_constants.dart';

class CelebrationAnimation extends StatefulWidget {
  @override
  _CelebrationAnimationState createState() => _CelebrationAnimationState();
}

class _CelebrationAnimationState extends State<CelebrationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
