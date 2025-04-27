import 'package:flutter/material.dart';
import 'package:personality_test_app/screens/personality_test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personality Test',
      home: const PersonalityTestApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
