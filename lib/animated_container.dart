import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget{
  final Duration duration;
  final Curve curve;
  const AnimatedContainerExample({super.key, required this.duration, required this.curve});

  @override
  State<AnimatedContainerExample> createState() => AnimatedContainerExampleState();
}

class AnimatedContainerExampleState extends State<AnimatedContainerExample>{
  bool isTriggered = false;
  int index = 0;

  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => setState((){
        // isTriggered = !isTriggered;
        index = (index + 1) % colors.length;
      }),
      child: AnimatedContainer(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        duration: widget.duration,
        curve: widget.curve,
        // color: isTriggered ? Colors.green : Colors.blue
        color: colors[index],
      )
    );
  }
}