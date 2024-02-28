import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String textToDisplay;

  const StyledText(this.textToDisplay, {super.key});

  @override
  Widget build(context) {
    return Text(
      textToDisplay,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
