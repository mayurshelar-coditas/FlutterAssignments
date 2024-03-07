import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numberOfQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numberOfCorrectQuestions Questions out of $numberOfQuestions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            QuizSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
