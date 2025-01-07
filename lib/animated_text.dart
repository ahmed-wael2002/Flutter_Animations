import 'package:flutter/material.dart';

class AnimatedTextExample extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  const AnimatedTextExample(
      {super.key, required this.duration, required this.curve});

  @override
  State<AnimatedTextExample> createState() => _AnimatedTextExampleState();
}

class _AnimatedTextExampleState extends State<AnimatedTextExample> {
  bool _bool = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _bool = !_bool;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: widget.duration,
          curve: widget.curve,
          style: TextStyle(
            fontSize: 24,
            color: _bool ? Colors.blue : Colors.red,
            fontWeight: _bool ? FontWeight.bold : FontWeight.normal,
          ),
          child: Text('Hello World'),
        ),
      )
    );
  }
}
