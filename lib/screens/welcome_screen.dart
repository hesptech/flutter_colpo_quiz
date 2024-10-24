import 'package:flutter/material.dart';
import 'package:flutter_colpo_quiz/screens/question_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => QuestionScreen(name: nameController.text,)
                  )
                );
              }, 
              child: const Text('Start Quiz'),
            )
          ],
        ),
      )
    );
  }
}