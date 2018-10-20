import 'package:flutter/material.dart';
import 'Controls/TwoPanelField.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String correctAnswer = "Stimulus 1";
  final String wrongAnswer = "Stimulus 2";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwoPanelField(
        correctAnswer: correctAnswer,
        wrongAnswer: wrongAnswer,
      ),
    );
  }
}
