import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  final quiz = const Quiz();
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity( This is 1st approach for opacity but it not recommended to do so.
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png',
          //   width: 300),
          // ),
          Image.asset(
            //Second to add color attr and adjusting its opacity
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(152, 251, 251, 251),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}
