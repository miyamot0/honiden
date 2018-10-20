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
  MediaQueryData mediaData;
  double iconWidth = 100.0;

  static final Color colorRed = Colors.redAccent;
  static final Color colorGreen = Colors.greenAccent;
  static final Color colorLerp = Color.lerp(colorGreen, colorRed, 0.15);

  void onWidgetDropped(String output) {
    print("onWidgetDropped(): $output");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Response"),
          content: Text(
            output == widget.correctAnswer ? "Correct Response" : "Incorrect Response"    
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    if (mediaData == null) {
      mediaData = MediaQuery.of(context);
      iconWidth = mediaData.size.height / 6.0;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          FieldDraggable(
            content: widget.correctAnswer,
            initialColor: colorLerp,
            initialOffset: Offset(
              (mediaData.size.width / 2) -  (iconWidth / 2),
              (mediaData.size.height / 4) - (iconWidth / 2),
            ),
          ),
          FieldDropWidget(
            entry: widget.correctAnswer,
            initialColor: colorGreen,
            isLeftPortion: true,
            callbackDropped: onWidgetDropped,
          ),
          FieldDropWidget(
            entry: widget.wrongAnswer,
            initialColor: colorRed,
            isLeftPortion: false,
            callbackDropped: onWidgetDropped,
          ),
        ],
      ),
    );
  }
}