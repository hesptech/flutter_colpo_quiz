

import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final String name;
  final int score;
  final int wrongAnswers;
  final int correctAnswers;

  const ScoreScreen({
    super.key, 
    required this.name, 
    required this.score, 
    required this.wrongAnswers, 
    required this.correctAnswers
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Congratulations $name!'),
              const SizedBox(height: 20),
              Text('You scored $score out of 4'),
              const SizedBox(height: 20),
              Text('Correct Answers: $correctAnswers'),
              const SizedBox(height: 20),
              Text('Wrong Answers: $wrongAnswers'),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.popUntil(
                    context, 
                    (route) => route.isFirst);
                }, 
                child: const Text('Play Again'),
              )
            ],
          ),
        ),
      )
    );
  }
}