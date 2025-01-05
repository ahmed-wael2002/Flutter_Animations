import 'package:flutter/material.dart';

import 'animated_align.dart';
import 'animated_builder.dart';
import 'animated_container.dart';

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
        body: AnimatedContainerExample(
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1)
        ),
      ),
    );
  }
}
