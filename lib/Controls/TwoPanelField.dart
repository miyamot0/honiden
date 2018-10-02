import 'package:flutter/material.dart';

import '../Views/FieldDraggable.dart';
import '../Views/FieldDropTarget.dart';

class TwoPanelField extends StatefulWidget {
  final String correctAnswer, wrongAnswer;

  const TwoPanelField(
  {
    Key key,
    this.correctAnswer,
    this.wrongAnswer
  }) : super(key: key);

  @override
  TwoPanelFieldState createState() => TwoPanelFieldState();
}

class TwoPanelFieldState extends State<TwoPanelField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FieldDraggable(
            content: widget.correctAnswer,
            initialOffset: Offset(
              100.0,
              100.0,
            ),
          ),
          FieldDropWidget(
            entry: widget.correctAnswer,
            isLeftPortion: true,
          ),
          FieldDropWidget(
            entry: widget.wrongAnswer,
            isLeftPortion: false,
          ),
        ],
      ),
    );
  }
}