import 'package:flutter/material.dart';
import './main.dart';
import 'dart:ui';

class Delete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _me = MediaQueryData.fromWindow(window);
    double width = _me.size.width;
    return Container(
      child: IconButton(
          icon: Icon(Icons.backspace_outlined, color: Colors.white),
          onPressed: () {
            MyApp c = MyApp();
            c.enter('delete');
          }),
      margin: EdgeInsets.only(left: width * 0.6),
    );
  }
}
