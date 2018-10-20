import 'package:flutter/material.dart';

class FieldDraggable extends StatefulWidget {
  final Offset initialOffset;
  final Color initialColor;

  const FieldDraggable(
  {
    Key key,
    this.initialOffset,
    this.initialColor,
  }) : super(key: key);

  @override
  FieldDraggableState createState() => FieldDraggableState();
}

class FieldDraggableState extends State<FieldDraggable> {
  Offset offset = Offset(0.0, 0.0);

  static const defaultStyle = const TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontFamily: "serif",
    fontSize: 20.0);

  @override
  void initState() {
    super.initState();

    offset = widget.initialOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Draggable(
        data: true,
        maxSimultaneousDrags: 1,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: widget.initialColor,
          child: Center(
            child: Text(
              "Drag Me!",
              style: defaultStyle,
            ),
          ),
        ),
        feedback: Container(
          width: 200.0,
          height: 200.0,
          color: widget.initialColor,
          child: Center(
            child: Text(
              "Drag Me!",
              style: defaultStyle,
            ),
          ),
        ),
        childWhenDragging: Opacity(opacity: 0.0),
        onDraggableCanceled: (v, o) {
          setState(() {
            offset = o;
          });
        },
        onDragCompleted: () {
          //widget.
          //dispose();
        },
      ),
    );
  }
}