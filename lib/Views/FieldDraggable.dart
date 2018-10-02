import 'package:flutter/material.dart';

class FieldDraggable extends StatefulWidget {
  final Offset initialOffset;
  final String content;

  const FieldDraggable(
  {
    Key key,
    this.initialOffset,
    this.content
  }) : super(key: key);

  @override
  FieldDraggableState createState() => FieldDraggableState(content);
}

class FieldDraggableState extends State<FieldDraggable> {
  final String content;

  Offset offset = Offset(0.0, 0.0);

  static const defaultStyle = const TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 20.0);

  FieldDraggableState(this.content);

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
        data: widget.content,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(
            child: Text(
              widget.content,
              style: defaultStyle,
            ),
          ),
        ),
        feedback: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(
            child: Text(
              widget.content,
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
      ),
    );
  }
}