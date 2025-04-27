// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:personality_test_app/widgets/my_button.dart';
import '../models/personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality resultPersonality;
  final VoidCallback onTryAgain;

  const ResultScreen({
    super.key,
    required this.resultPersonality,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    final description = personalityDescriptions[resultPersonality]!;

    IconData personalityIcon;
    Color personalityColor;

    switch (resultPersonality) {
      case Personality.thinker:
        personalityIcon = Icons.psychology;
        personalityColor = Colors.blue;
        break;
      case Personality.feeler:
        personalityIcon = Icons.favorite;
        personalityColor = Colors.red;
        break;
      case Personality.planner:
        personalityIcon = Icons.calendar_today;
        personalityColor = Colors.orange;
        break;
      case Personality.adventurer:
        personalityIcon = Icons.explore;
        personalityColor = Colors.green;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: personalityColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(personalityIcon, color: Colors.white, size: 40),
        ),
        
        SizedBox(height: 30),
        
        Text(
          description.split('\n')[0],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        
        SizedBox(height: 10),
        
        Text(
          description.split('\n')[1],
          style: const TextStyle(fontSize: 16, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        
        SizedBox(height: 40),
        
        MyButton(text: 'Try Again', function: onTryAgain)
      ],
    );
  }
}
