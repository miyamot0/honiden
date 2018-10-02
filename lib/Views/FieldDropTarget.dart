import 'package:flutter/material.dart';

class FieldDropWidget extends StatefulWidget {
  final String entry;
  final double left, top;

  const FieldDropWidget({
    Key key,
    @required this.entry,
    @required this.left,
    @required this.top,
  }) : super(key: key);

  @override
  FieldDropWidgetState createState() => FieldDropWidgetState();
}

class FieldDropWidgetState extends State<FieldDropWidget> {
  String collectedData;
  Color currentColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: DragTarget(
        builder: (context, accepted, rejected) {
          return Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              color: currentColor
            ),
            child: Center(
              child: Text(widget.entry),
            ),
          );
        },
        onWillAccept: (value) => collectedData == null,
        onAccept: (String data) {
          if (data == widget.entry)
            currentColor = Colors.green;
          else
            currentColor = Colors.red;
        },
        onLeave: (value) => setState(() {
          currentColor = Colors.grey;
        }),
      ),
    );
  }
}