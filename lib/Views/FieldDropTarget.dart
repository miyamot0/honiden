import 'package:flutter/material.dart';

class FieldDropWidget extends StatefulWidget {
  final String entry;
  final bool isLeftPortion;

  const FieldDropWidget({
    Key key,
    @required this.entry,
    @required this.isLeftPortion,
  }) : super(key: key);

  @override
  FieldDropWidgetState createState() => FieldDropWidgetState();
}

class FieldDropWidgetState extends State<FieldDropWidget> {
  static const double padding = 10.0;

  String collectedData;
  Color currentColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Positioned(
      bottom: padding,
      left: widget.isLeftPortion ? padding : (mediaQuery.size.width / 2.0) + padding / 2.0,
      child: DragTarget(
        builder: (context, accepted, rejected) {
          return Container(
            height: mediaQuery.size.height / 3.0,
            width: (mediaQuery.size.width - padding * 3.0) / 2.0,
            decoration: BoxDecoration(
              color: currentColor,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              )
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
          currentColor = Colors.transparent;
        }),
      ),
    );
  }
}