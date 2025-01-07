import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  const AnimatedCrossFadeExample(
      {super.key, required this.duration, required this.curve});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: AnimatedCrossFade(
            duration: widget.duration,
            firstChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.markOnly),
            secondChild: const FlutterLogo(size: 200, style: FlutterLogoStyle.horizontal,),
            crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstCurve: Curves.bounceIn,
            secondCurve: Curves.easeInOut,
      )),
    );
  }
}
