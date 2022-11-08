import 'package:flutter/material.dart';

class Textarea extends StatelessWidget {
  final mycontroller = TextEditingController();
  void enter(String s) {
    mycontroller.text = "hello";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: mycontroller,
        cursorHeight: 50,
        style: TextStyle(fontSize: 40, color: Colors.blue),
        textDirection: TextDirection.rtl,
        showCursor: true,
        readOnly: true,
      ),
      margin: EdgeInsets.only(bottom: 40, top: 200),
    );
  }
}
