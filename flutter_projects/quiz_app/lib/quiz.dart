import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
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

  void switchScreen() {
    setState(() {
      //activeScreen = QuestionsScreen();
      activeScreen = 'questions_screen';
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
            gradient:
                LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple])),
        child: activeScreen == 'startScreen'
            ? StartScreen(switchScreen)
            : const QuestionsScreen(),
      )),
    );
  }
}
