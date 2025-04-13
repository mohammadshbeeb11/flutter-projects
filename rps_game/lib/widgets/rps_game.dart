import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rps_game/widgets/custom_button.dart';
import 'package:rps_game/widgets/score_container.dart';

class RPSGame extends StatefulWidget {
  const RPSGame({super.key});
  @override
  State<RPSGame> createState() => _RPSGameState();
}

class _RPSGameState extends State<RPSGame> {
  String computerChoice = '?';
  String playerChoice = '?';

  int playerScore = 0;
  int computerScore = 0;

  String result(String playerChoice, String computerChoice) {
    if (playerChoice == computerChoice) {
    } else if ((playerChoice == 'rock' && computerChoice == 'sissors') ||
        (playerChoice == 'paper' && computerChoice == 'rock') ||
        (playerChoice == 'sissors' && computerChoice == 'paper')) {
      playerScore++;
    } else {
      computerScore++;
    }

    return (playerChoice == computerChoice)
        ? 'Draw'
        : ((playerChoice == 'rock' && computerChoice == 'sissors') ||
            (playerChoice == 'paper' && computerChoice == 'rock') ||
            (playerChoice == 'sissors' && computerChoice == 'paper'))
        ? 'Player wins!'
        : 'Computer wins!';
  }

  void rockChoice() {
    setState(() {
      playerChoice = 'rock';
      computerChoice = ['rock', 'paper', 'sissors'][Random().nextInt(3)];
    });
  }

  void paperChoice() {
    setState(() {
      playerChoice = 'paper';
      computerChoice = ['rock', 'paper', 'sissors'][Random().nextInt(3)];
    });
  }

  void sissorsChoice() {
    setState(() {
      playerChoice = 'sissors';
      computerChoice = ['rock', 'paper', 'sissors'][Random().nextInt(3)];
    });
  }

  void reset() {
    setState(() {
      playerScore = 0;
      computerScore = 0;
      playerChoice = '?';
      computerChoice = '?';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScoreContainer(
              result: 'Computer Choice $computerChoice',
              textStyle: Theme.of(context).textTheme.headlineMedium!,
            ),

            ScoreContainer(
              result: 'Player Choice $playerChoice',
              textStyle: Theme.of(context).textTheme.headlineMedium!,
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(onPressed: rockChoice, icon: '✊'),
                SizedBox(width: 10),
                MyButton(onPressed: paperChoice, icon: '✋'),
                SizedBox(width: 10),
                MyButton(onPressed: sissorsChoice, icon: '✌️'),
              ],
            ),

            SizedBox(height: 40),

            ScoreContainer(
              result: 'Result: ${result(playerChoice, computerChoice)}',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            ScoreContainer(
              result: 'Your Score: $playerScore',
              textStyle: Theme.of(context).textTheme.headlineSmall!,
            ),

            SizedBox(height: 20),

            ScoreContainer(
              result: 'Computer Score: $computerScore',
              textStyle: Theme.of(context).textTheme.headlineSmall!,
            ),

            SizedBox(height: 20),

            MyButton(onPressed: reset, icon: 'Reset Button'),
          ],
        ),
      ),
    );
  }
}
