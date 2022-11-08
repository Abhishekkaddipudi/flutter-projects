import 'package:flutter/material.dart';
import './main.dart';
import 'dart:ui';

class Numbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _me = MediaQueryData.fromWindow(window);
    double width = _me.size.width;

    return Container(
        width: (width),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('=');
                  },
                  child: Text('='),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
                margin: EdgeInsets.only(right: width * 0.44),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('clear');
                  },
                  child: Text('C'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('1');
                  },
                  child: Text('1'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('2');
                  },
                  child: Text('2'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('3');
                  },
                  child: Text('3'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('4');
                  },
                  child: Text('4'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('5');
                  },
                  child: Text('5'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('6');
                  },
                  child: Text('6'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('7');
                  },
                  child: Text('7'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('8');
                  },
                  child: Text('8'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('9');
                  },
                  child: Text('9'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('0');
                  },
                  child: Text('0'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('.');
                  },
                  child: Text('.'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('%');
                  },
                  child: Text('%'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('+');
                  },
                  child: Text('+'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('-');
                  },
                  child: Text('-'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('*');
                  },
                  child: Text('*'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    MyApp c = MyApp();
                    c.enter('/');
                  },
                  child: Text('/'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(width * 0.02),
              ),
            ],
          ),
        ]));
  }
}
