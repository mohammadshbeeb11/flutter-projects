// lib/screens/start_screen.dart
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStartTest;

  const StartScreen({super.key, required this.onStartTest});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Text(
            'Discover Your\nPersonality Type!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          
          // Personality type icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPersonalityIcon(Colors.red, Icons.favorite),
              _buildPersonalityIcon(Colors.blue, Icons.psychology),
            ],
          ),
          
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPersonalityIcon(Colors.orange, Icons.calendar_today),
              _buildPersonalityIcon(Colors.green, Icons.explore),
            ],
          ),

          SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blueGrey[700],
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: onStartTest,
            child: const Text('Start Test'),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalityIcon(Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}
