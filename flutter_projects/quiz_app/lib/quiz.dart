import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void chooseAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = 'questions_screen';
      },
    );
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "start_screen";
    });
  }

  //1st approach and the second one is used i.e. uncommented.
  // @override
  // void initState() {
  //   activeScreen = const StartScreen();
  //   super.initState();
  // }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurple])),
          child: activeScreen == 'start_screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'questions_screen'
                  ? QuestionsScreen(onSelectAnswer: chooseAnswer)
                  : ResultScreen(
                      chosenAnswers: selectedAnswers, onRestart: restartQuiz),
        ),
      ),
    );
  }
}
