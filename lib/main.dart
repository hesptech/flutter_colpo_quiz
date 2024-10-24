import 'package:flutter/material.dart';
import 'package:flutter_colpo_quiz/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        useMaterial3: true
      ),
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
