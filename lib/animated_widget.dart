import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningContainer extends AnimatedWidget{
  final AnimationController controller;
  const SpinningContainer({super.key, required this.controller}) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context){
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: FlutterLogo(size: 50),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  const AnimatedWidgetExample({super.key, required this.duration, required this.curve});

  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample> with TickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinningContainer(controller: _controller));
  }
}
