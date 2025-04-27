import 'package:flutter/material.dart';
import 'package:personality_test_app/data/questions.dart';
import 'package:personality_test_app/models/personality.dart';
import 'package:personality_test_app/models/question.dart';
import 'package:personality_test_app/screens/question_screen.dart';
import 'package:personality_test_app/screens/result_screen.dart';
import 'package:personality_test_app/screens/start_screen.dart';

enum AppScreen { start, question, result }

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({super.key});

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  AppScreen _currentScreen = AppScreen.start;
  final List<Question> _questions = getQuestions();
  int _currentQuestionIndex = 0;
  Map<Personality, int> _scores = {};
  Personality? _resultPersonality;

  @override
  void initState() {
    super.initState();
    _resetTest();
  }

  void _resetTest() {
    setState(() {
      _currentScreen = AppScreen.start;
      _currentQuestionIndex = 0;
      _scores = {
        Personality.thinker: 0,
        Personality.feeler: 0,
        Personality.planner: 0,
        Personality.adventurer: 0,
      };
      _resultPersonality = null;
    });
  }

  void _startTest() {
    setState(() {
      _currentScreen = AppScreen.question;
    });
  }

  void _selectAnswer(int answerIndex) {
    final selectedPersonality =
        _questions[_currentQuestionIndex].answers[answerIndex].personality;

    setState(() {
      _scores[selectedPersonality] = _scores[selectedPersonality]! + 1;

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _calculateResult();
        _currentScreen = AppScreen.result;
      }
    });
  }

  void _calculateResult() {
    Personality highestPersonality = Personality.thinker; // Default
    int highestScore = _scores[Personality.thinker]!;

    _scores.forEach((personality, score) {
      if (score > highestScore) {
        highestScore = score;
        highestPersonality = personality;
      }
    });

    _resultPersonality = highestPersonality;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blueGrey[700]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildCurrentScreen(),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case AppScreen.start:
        return StartScreen(onStartTest: _startTest);
      case AppScreen.question:
        return QuestionScreen(
          question: _questions[_currentQuestionIndex],
          onAnswerSelected: _selectAnswer,
          currentQuestionIndex: _currentQuestionIndex,
          totalQuestions: _questions.length,
        );
      case AppScreen.result:
        return ResultScreen(
          resultPersonality: _resultPersonality!,
          onTryAgain: _resetTest,
        );
    }
  }
}
