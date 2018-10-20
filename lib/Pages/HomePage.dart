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

class HomePage extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Discrimination Trial Task"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              child: Text("Easy (10% Similarity)"),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => TrialPage(0.2)),
                );
              }
            ),
            MaterialButton(
              child: Text("Mild (20% Similarity)"),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => TrialPage(0.4)),
                );
              }
            ),
            MaterialButton(
              child: Text("Moderate (30% Similarity)"),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => TrialPage(0.6)),
                );
              }
            ),
            MaterialButton(
              child: Text("High (40% Similarity)"),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => TrialPage(0.8)),
                );
              }
            ),
            MaterialButton(
              child: Text("Impossible (50% Similarity)"),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => TrialPage(1.0)),
                );
              }
            )
          ]
        ),
      )
    );
  }
}