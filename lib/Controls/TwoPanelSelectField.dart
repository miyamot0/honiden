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
import 'dart:math';

class TwoPanelSelectField extends StatefulWidget {
  final double discriminabilityDifficulty;

  const TwoPanelSelectField(
  {
    Key key,
    @required this.discriminabilityDifficulty,
  }) : super(key: key);

  @override
  TwoPanelSelectFieldState createState() => TwoPanelSelectFieldState();
}

class TwoPanelSelectFieldState extends State<TwoPanelSelectField> with SingleTickerProviderStateMixin {
  MediaQueryData mediaData;
  double iconWidth = 100.0;
  int trialsCompleted = 0;
  static const double padding = 50.0;

  bool locationRandomizer = Random().nextInt(100) % 2 == 0;

  static final List<Color> possibleColors = [Colors.white, Colors.black];

  Color colorCorrect = possibleColors[Random().nextInt(possibleColors.length - 1)];
  Color colorFoil = possibleColors[Random().nextInt(possibleColors.length - 1)];
  Color colorLerp;

  AnimationController animController;

  void onSelected(bool output) async {
    trialsCompleted = trialsCompleted + 1;

    await showDialog(
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

    if (trialsCompleted >= 3) {
      Navigator.pop(context);
    }

    colorCorrect = possibleColors[Random().nextInt(possibleColors.length)];
    colorFoil = possibleColors[Random().nextInt(possibleColors.length)];

    while (colorCorrect == colorFoil) {
      colorFoil = possibleColors[Random().nextInt(possibleColors.length)];
    }

    locationRandomizer = Random().nextInt(100) % 2 == 0;

    animController.forward(from: 0.0);
  }

  @override
  void initState()
  {
    super.initState();

    animController = new AnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: new Duration(milliseconds: 500),
      vsync: this
    )
    ..addListener(() 
    {
      this.setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.reverse();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_)  => animController.forward());
  }

  @override
  Widget build(BuildContext context) {

    while (colorCorrect == colorFoil) {
      colorFoil = possibleColors[Random().nextInt(possibleColors.length)];
    }

    colorLerp = Color.lerp(colorCorrect, colorFoil, widget.discriminabilityDifficulty);

    if (mediaData == null) {
      mediaData = MediaQuery.of(context);
      iconWidth = mediaData.size.height / 6.0;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Opacity(
              child: Container(              
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: colorLerp,
                ),
              ),
              opacity: animController.value,
            ),
            left: (mediaData.size.width / 2) - (iconWidth / 2),
            top:  (mediaData.size.height / 4) - (iconWidth / 2),
            width: iconWidth,
            height: iconWidth,
          ),
          Positioned(
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: colorCorrect,
                ),
              ),
              onTap: () {
                if (animController.isAnimating) return;

                onSelected(true);
              },
            ),
            left: locationRandomizer ? padding : (mediaData.size.width) - padding - iconWidth,
            bottom: padding,
            width: iconWidth,
            height: iconWidth,
          ),
          Positioned(
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: colorFoil,
                ),
              ),
              onTap: () {
                if (animController.isAnimating) return;
                
                onSelected(false);
              },
            ),
            left: !locationRandomizer ? padding : (mediaData.size.width) - padding - iconWidth,
            bottom: padding,
            width: iconWidth,
            height: iconWidth,
          )
        ],
      ),
    );
  }
}