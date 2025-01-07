import 'package:flutter/material.dart';
import 'package:untitled2/animated_crossfade.dart';
import 'package:untitled2/animated_list.dart';

import 'animated_align.dart';
import 'animated_builder.dart';
import 'animated_container.dart';
import 'animated_text.dart';
import 'animated_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Animation Example')),
        body: AnimatedWidgetExample(
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1)
        ),
      ),
    );
  }
}
