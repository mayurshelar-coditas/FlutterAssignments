import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;
  @override
  Widget build(context) {
    int results = 0;
    for (int answer = 0; answer < selectedAnswers.length; answer++) {
      if (selectedAnswers.elementAt(answer) == questions[answer].answers[0]) {
        results++;
      }
    }

    return Container(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Text(
          "You got $results Questions correct out of ${questions.length} Questions.",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
