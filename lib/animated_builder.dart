import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderExample extends StatefulWidget {
  final Duration duration;
  final Curve curve;

  const AnimatedBuilderExample(
      {super.key, required this.duration, required this.curve});

  @override
  State<AnimatedBuilderExample> createState() => AnimatedBuilderExampleState();
}

class AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _controller,
          child: FlutterLogo(size: 150),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi, child: child);
          }),
    );
  }
}
