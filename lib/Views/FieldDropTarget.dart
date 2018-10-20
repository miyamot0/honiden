/* 
    The MIT License

    Copyright September 1, 2018 Shawn Gilroy/Louisiana State University

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
*/

import 'package:flutter/material.dart';

class FieldDropWidget extends StatefulWidget {
  final bool isLeftPortion;
  final Function callbackDropped;
  final Color initialColor;
  final bool isCorrect;

  final GlobalKey<FieldDropWidgetState> stateKey = GlobalKey<FieldDropWidgetState>();

  FieldDropWidget({
    Key key,
    @required this.isLeftPortion,
    @required this.callbackDropped,
    @required this.initialColor,
    @required this.isCorrect,
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
              child: Text(""),
            ),
          );
        },
        onWillAccept: (value) => collectedData == null,
        onAccept: (bool data) {
          widget.callbackDropped(widget.isCorrect);
        },
        onLeave: (value) => setState(() {}),
      ),
    );
  }
}