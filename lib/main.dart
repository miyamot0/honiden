import 'package:flutter/material.dart';

import 'Views/FieldDraggable.dart';
import 'Views/FieldDropTarget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String correctAnswer = "Stimulus 1";
  final String wrongAnswer = "Stimulus 2";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            FieldDraggable(
              content: correctAnswer,
              initialOffset: Offset(100.0, 100.0),
            ),
            FieldDropWidget(
              entry: correctAnswer,
              left: 100.0,
              top: 500.0,
            ),
            FieldDropWidget(
              entry: wrongAnswer,
              left: 600.0,
              top: 500.0,
            )
          ],
        ),
      ),
    );
  }
}
