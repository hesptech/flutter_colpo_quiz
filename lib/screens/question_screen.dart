import 'package:flutter/material.dart';
import 'package:flutter_colpo_quiz/screens/score_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String name;
  const QuestionScreen({super.key, required this.name});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  int score = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  final List<Map<String, Object>> question = [
    {
      'question': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'score': 1},
        {'text': 'London', 'score': 0},
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'question': 'What is the capital of Spain?',
      'answers': [
        {'text': 'Paris', 'score': 0},
        {'text': 'London', 'score': 0},
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 1},
      ],
    },
    {
      'question': 'What is the capital of Germany?',
      'answers': [
        {'text': 'Paris', 'score': 0},
        {'text': 'London', 'score': 0},
        {'text': 'Berlin', 'score': 1},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'question': 'What is the capital of England?',
      'answers': [
        {'text': 'Paris', 'score': 0},
        {'text': 'London', 'score': 1},
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    if (score == 1) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
    setState(() {
      questionIndex++;
    });

    if(questionIndex >= question.length) {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => ScoreScreen(
            name: widget.name,
            score: score,
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers
          )
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${questionIndex + 1}'),
      ),
      body: questionIndex < question.length
          ? Center(
            child: Column(
                children: [
                  Text(
                    question[questionIndex]['question'] as String,
                    style: const TextStyle(fontSize: 20),
                  ),
                  ...(question[questionIndex]['answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return ElevatedButton(
                      onPressed: () => _answerQuestion(answer['score'] as int),
                      child: Text(answer['text'] as String),
                    );
                  }).toList(),
                ],
              ),
          )
          : const Center(
            child: CircularProgressIndicator(),
          ),


      /* body: Column(
        children: [
          Text(
            question[questionIndex]['question'] as String,
            style: const TextStyle(fontSize: 20),
          ),
          ...(question[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return ElevatedButton(
              onPressed: () {
                if (answer['score'] == 1) {
                  correctAnswers++;
                } else {
                  wrongAnswers++;
                }
                setState(() {
                  questionIndex++;
                });
              },
              child: Text(answer['text'] as String),
            );
          }).toList(),
          if (questionIndex == question.length)ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Finish'),
            ),
        ],
      ), */
    );
  }
}