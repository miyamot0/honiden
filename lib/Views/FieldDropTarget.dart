import 'package:flutter/material.dart';

class FieldDropWidget extends StatefulWidget {
  final String entry;
  final bool isLeftPortion;
  final Function callbackDropped;
  final Color initialColor;

  final GlobalKey<FieldDropWidgetState> stateKey = GlobalKey<FieldDropWidgetState>();

  FieldDropWidget({
    Key key,
    @required this.entry,
    @required this.isLeftPortion,
    @required this.callbackDropped,
    @required this.initialColor,
  }) : super(key: key);

  @override
  FieldDropWidgetState createState() => FieldDropWidgetState(key: stateKey);
}

class FieldDropWidgetState extends State<FieldDropWidget> {
  static const double padding = 10.0;

  String collectedData;

  FieldDropWidgetState({
    key
  });

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
              color: widget.initialColor,
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
          if (data == widget.entry) {
            //currentColor = Colors.green;
          }
          else {
            //currentColor = Colors.red;
          }

          widget.callbackDropped(data);
        },
        onLeave: (value) => setState(() {
          //currentColor = Colors.transparent;
          //widget.callbackDropped("onLeave()");
        }),
      ),
    );
  }
}