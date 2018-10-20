import 'package:flutter/material.dart';

import '../Views/FieldDraggable.dart';
import '../Views/FieldDropTarget.dart';

class TwoPanelField extends StatefulWidget {
  const TwoPanelField(
  {
    Key key,
  }) : super(key: key);

  @override
  TwoPanelFieldState createState() => TwoPanelFieldState();
}

class TwoPanelFieldState extends State<TwoPanelField> {
  MediaQueryData mediaData;
  double iconWidth = 100.0;

  static final Color colorCorrect = Colors.greenAccent;
  static final Color colorFoil = Colors.redAccent;
  static final Color colorLerp = Color.lerp(colorCorrect, colorFoil, 0.15);

  void onWidgetDropped(bool output) {
    print("onWidgetDropped(): $output");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Response"),
          content: Text(
            output ? "Correct Response" : "Incorrect Response"    
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
            initialColor: colorLerp,
            initialOffset: Offset(
              (mediaData.size.width / 2) -  (iconWidth / 2),
              (mediaData.size.height / 4) - (iconWidth / 2),
            ),
          ),
          FieldDropWidget(
            initialColor: colorCorrect,
            isLeftPortion: true,
            isCorrect: true,
            callbackDropped: onWidgetDropped,
          ),
          FieldDropWidget(
            initialColor: colorFoil,
            isLeftPortion: false,
            isCorrect: false,
            callbackDropped: onWidgetDropped,
          ),
        ],
      ),
    );
  }
}