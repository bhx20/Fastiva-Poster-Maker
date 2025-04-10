import 'package:flutter/material.dart';

class FadeWidget extends StatefulWidget {
  final Widget child;
  const FadeWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<FadeWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    const delay = Duration(seconds: 5);
    _controller = AnimationController(
      duration: const Duration(seconds: 2) + delay,
      vsync: this,
    );
    _animation = DelayedCurvedAnimation(
      controller: _controller,
      delayEnd: delay,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DelayedCurvedAnimation extends CurvedAnimation {
  DelayedCurvedAnimation({
    required AnimationController controller,
    Duration delayStart = Duration.zero,
    Duration delayEnd = Duration.zero,
    Curve curve = Curves.linear,
  }) : super(
          parent: controller,
          curve: _calcInterval(controller, delayStart, delayEnd, curve),
        );

  static Interval _calcInterval(AnimationController controller,
      Duration delayStart, Duration delayEnd, Curve curve) {
    final animationStartDelayRatio =
        delayStart.inMicroseconds / controller.duration!.inMicroseconds;
    final animationEndDelayRatio =
        delayEnd.inMicroseconds / controller.duration!.inMicroseconds;
    return Interval(animationStartDelayRatio, 1 - animationEndDelayRatio,
        curve: curve);
  }
}
