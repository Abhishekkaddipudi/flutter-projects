import 'package:flutter/material.dart';
import './numbers.dart';
import './delete.dart';
import 'dart:ui';

var mycontroller = TextEditingController();
var ans = TextEditingController();
var first = 0.0;
var sec = 0.0;
var res = 0.0;
String strres;
String nume;
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  void enter(String s) {
    if (s == 'delete') {
      if (mycontroller.text.length != 0) {
        mycontroller.text =
            mycontroller.text.substring(0, mycontroller.text.length - 1);
      }
    } else if (s == 'clear') {
      mycontroller.text = '';
      ans.text = '';
    } else if (s == '.') {
      if (mycontroller.text.indexOf('.') == -1) {
        mycontroller.text += s;
      }
    } else if (s == '+') {
      if (mycontroller.text.indexOf('+') == -1 &&
          mycontroller.text.indexOf('-') == -1 &&
          mycontroller.text.indexOf('*') == -1 &&
          mycontroller.text.indexOf('/') == -1 &&
          mycontroller.text.indexOf('%') == -1 &&
          mycontroller.text.length > 0) {
        mycontroller.text += s;
      }
    } else if (s == '-') {
      if (mycontroller.text.indexOf('+') == -1 &&
          mycontroller.text.indexOf('-') == -1 &&
          mycontroller.text.indexOf('*') == -1 &&
          mycontroller.text.indexOf('/') == -1 &&
          mycontroller.text.indexOf('%') == -1 &&
          mycontroller.text.length > 0) {
        mycontroller.text += s;
      }
    } else if (s == '*') {
      if (mycontroller.text.indexOf('+') == -1 &&
          mycontroller.text.indexOf('-') == -1 &&
          mycontroller.text.indexOf('*') == -1 &&
          mycontroller.text.indexOf('/') == -1 &&
          mycontroller.text.indexOf('%') == -1 &&
          mycontroller.text.length > 0) {
        mycontroller.text += s;
      }
    } else if (s == '/') {
      if (mycontroller.text.indexOf('+') == -1 &&
          mycontroller.text.indexOf('-') == -1 &&
          mycontroller.text.indexOf('*') == -1 &&
          mycontroller.text.indexOf('/') == -1 &&
          mycontroller.text.indexOf('%') == -1 &&
          mycontroller.text.length > 0) {
        nume = mycontroller.text;
        mycontroller.text = nume + s;
      }
    } else if (s == '%') {
      if (mycontroller.text.indexOf('+') == -1 &&
          mycontroller.text.indexOf('-') == -1 &&
          mycontroller.text.indexOf('*') == -1 &&
          mycontroller.text.indexOf('/') == -1 &&
          mycontroller.text.indexOf('%') == -1 &&
          mycontroller.text.length > 0) {
        mycontroller.text += s;
      }
    } else if (s == '=') {
      if (mycontroller.text.length > 2) {
        if (mycontroller.text.indexOf('+') != -1) {
          first = double.parse(
              mycontroller.text.substring(0, mycontroller.text.indexOf('+')));
          sec = double.parse(mycontroller.text.substring(
              mycontroller.text.indexOf('+') + 1, mycontroller.text.length));
          res = first + sec;

          ans.text = res.toString();
        }
        if (mycontroller.text.indexOf('-') != -1) {
          first = double.parse(
              mycontroller.text.substring(0, mycontroller.text.indexOf('-')));
          sec = double.parse(mycontroller.text.substring(
              mycontroller.text.indexOf('-') + 1, mycontroller.text.length));
          res = first - sec;

          ans.text = res.toString();
        }
        if (mycontroller.text.indexOf('*') != -1) {
          first = double.parse(
              mycontroller.text.substring(0, mycontroller.text.indexOf('*')));
          sec = double.parse(mycontroller.text.substring(
              mycontroller.text.indexOf('*') + 1, mycontroller.text.length));
          res = first * sec;

          ans.text = res.toString();
        }
        if (mycontroller.text.indexOf('/') != -1) {
          first = double.parse(
              mycontroller.text.substring(0, mycontroller.text.indexOf('/')));
          sec = double.parse(mycontroller.text.substring(
              mycontroller.text.indexOf('/') + 1, mycontroller.text.length));
          res = first / sec;

          ans.text = res.toString();
        }
        if (mycontroller.text.indexOf('%') != -1) {
          first = double.parse(
              mycontroller.text.substring(0, mycontroller.text.indexOf('%')));
          sec = double.parse(mycontroller.text.substring(
              mycontroller.text.indexOf('%') + 1, mycontroller.text.length));
          res = first % sec;

          ans.text = res.toString();
        }
      }
    } else {
      mycontroller.text += s;
    }
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _me = MediaQueryData.fromWindow(window);
    double width = _me.size.width;
    double height = _me.size.height;
    print(width * 0.1);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: width * 0.1,
          leading: IconButton(
              icon: Icon(
                Icons.calculate,
                color: Colors.white,
              ),
              onPressed: null),
          shadowColor: Colors.white,
          title: Container(
            child: TextButton(
              onPressed: null,
              child: Text('CALCULATOR',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline)),
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(left: width * 0.07),
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  controller: mycontroller,
                  style: TextStyle(fontSize: width * 0.1, color: Colors.blue),
                  textDirection: TextDirection.ltr,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                margin: EdgeInsets.only(bottom: height * 0.07),
              ),
              Container(
                child: TextField(
                  controller: ans,
                  cursorHeight: 50,
                  style: TextStyle(fontSize: width * 0.1, color: Colors.blue),
                  textDirection: TextDirection.ltr,
                  readOnly: true,
                ),
                margin: EdgeInsets.only(bottom: height * 0.03),
              ),
              Delete(),
              Numbers()
            ],
          ),
        ),
      ),
    );
  }
}
