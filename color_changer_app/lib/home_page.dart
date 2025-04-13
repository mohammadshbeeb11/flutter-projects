import 'dart:math';
import 'package:flutter/material.dart';
import 'package:color_changer_app/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _spacingBetweenElements = 20.0;
  static const double _largeSpacingBetweenElements = 40.0;

  Color _backgroundColor = Colors.black;
  Color _secondBackgroundColor = Colors.white;
  int _currentDirectionIndex = 0;

  final List _gradientDirections = [
    [Alignment.topCenter, Alignment.bottomCenter], // Vertical
    [Alignment.centerLeft, Alignment.centerRight], // Horizontal
    [Alignment.topLeft, Alignment.bottomRight], // Diagonal Left-Right
    [Alignment.topRight, Alignment.bottomLeft], // Diagonal Right-Left
  ];

  final List _directionNames = [
    "Vertical",
    "Horizontal",
    "Diagonal Left-Right",
    "Diagonal Right-Left",
  ];

  int i = 0, j = 0, k = 0;

  void _rotateGradientDirection() {
    setState(() {
      _currentDirectionIndex =
          (_currentDirectionIndex + 1) % _gradientDirections.length;
    });
  }

  void _generateRandomColor() {
    i = Random().nextInt(255) + 1;
    j = Random().nextInt(255) + 1;
    k = Random().nextInt(255) + 1;
    setState(() {
      _backgroundColor = Color.fromARGB(200, i, j, k);
      _secondBackgroundColor = Color.fromARGB(200, j, i, k);
    });
  }

  List get _currentGradientDirection =>
      _gradientDirections[_currentDirectionIndex];

  String get _currentDirectionName => _directionNames[_currentDirectionIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _currentGradientDirection[0],
            end: _currentGradientDirection[1],
            colors: [
              _backgroundColor,
              _secondBackgroundColor,
              _backgroundColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            MyButton(onPressed: _generateRandomColor, name: "Change color"),
            
            SizedBox(height: _spacingBetweenElements),
            
            Text(
              "Red: $i, Blue: $j, Green: $k",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            
            SizedBox(height: _largeSpacingBetweenElements),
            
            MyButton(
              onPressed: _rotateGradientDirection,
              name: "Change Direction",
            ),
            
            SizedBox(height: _spacingBetweenElements),
            
            Text(
              "Direction: $_currentDirectionName",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
