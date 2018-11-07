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

import '../Pages/TrialPage.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double difficultyValue = 1.0;
  double trialCount = 3.0;

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Discrimination Trial Task"),
      ),
      body: Align(
        alignment: Alignment.center,        
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10.0,
            left: 100.0,
            right: 100.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50.0,
                ),
                child: Text(
                  "To begin the visual discrimination task, select the number of trials desired and the level of difficulty. The levels of difficulty represent the distance from equal difference between each of the stimuli (i.e., equal similarity)"
                ),
              ),
              Text(
                "Select Number of Trials"
              ),
              Slider(
                value: trialCount,
                min: 1.0,
                max: 10.0,              
                divisions: 9,
                label: 'Run $trialCount Trials',
                onChanged: (double value) {
                  setState(() {
                    trialCount = num.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: Text(
                  "Select Level of Difficulty"
                ),
              ),
              Slider(
                value: difficultyValue,
                min: 0.0,
                max: 50.0,              
                divisions: 50,
                label: '$difficultyValue % Similarity',
                onChanged: (double value) {
                  setState(() {
                    difficultyValue = num.parse(value.toStringAsFixed(2));
                  });
                },
              ),
              MaterialButton(
                child: Text("Run ${trialCount.round()} Trials at $difficultyValue % Similarity"),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.push(
                    ctxt,
                    new MaterialPageRoute(builder: (ctxt) => TrialPage(
                      difficultyValue / 200.0,
                      trialCount.round(),
                      )
                    ),
                  );
                }
              ),
            ]
          ),
        ),
      )
    );
  }
}