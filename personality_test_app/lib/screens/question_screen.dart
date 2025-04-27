// lib/screens/question_screen.dart
import 'package:flutter/material.dart';
import 'package:personality_test_app/widgets/my_button.dart';
import '../models/question.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(int) onAnswerSelected;
  final int currentQuestionIndex;
  final int totalQuestions;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        // Question
        Text(
          question.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        SizedBox(height: 40),

        // Answers
        ...List.generate(question.answers.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 24.0,
            ),
            child: MyButton(text: question.answers[index].text, function: () => onAnswerSelected(index))
          );
        }),
        const SizedBox(height: 30),
        
        // Question tracker
        Text(
          'Question ${currentQuestionIndex + 1} of $totalQuestions',
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
