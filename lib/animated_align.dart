import 'package:flutter/material.dart';
class AnimatedAlignExample extends StatefulWidget{
  final Duration duration;
  final Curve curve;
  const AnimatedAlignExample({super.key, required this.duration, required this.curve});

  // State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
  @override
  State<AnimatedAlignExample> createState() => AnimatedAlignExampleState();
}

class AnimatedAlignExampleState extends State<AnimatedAlignExample>{
  bool isSelected = false;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => setState((){
        isSelected = !isSelected;
      }),
      child: AnimatedAlign(
        curve: widget.curve,
        duration: widget.duration,
        alignment: isSelected ? Alignment.topRight : Alignment.bottomLeft,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        )
      )
    );
  }
}