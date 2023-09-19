import 'dart:math';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double? _top;
  double? _left;
  double _angle = 0;
  double _height = 50;
  double _width = 50;
  Color _color = Colors.black;

  _MyHomePageState() {
    _top = MediaQuery.of(context).size.height / 2 - _height / 2;
    _left = MediaQuery.of(context).size.width / 2 - _width / 2;
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController _rotationController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    final Animation<double> _rotationAnimation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.elasticOut,
    );

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: _left,
          top: _top,
          width: _width,
          height: _height,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: ColoredBox(
              color: _color,
            ),
          ),
        ),
        Positioned.fill(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _color = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                  });
                },
                onLongPress: () {
                  _rotationController.reset();
                  _rotationController.forward();
                },
                onVerticalDragUpdate: _onDragChanged,
                onHorizontalDragUpdate: _onDragChanged)),
      ],
    ));
  }

  void _onDragChanged(DragUpdateDetails details) {
    setState(() {
      _left = details.globalPosition.dx - _width / 2;
      _top = details.globalPosition.dy - _height / 2;
    });
  }
}
