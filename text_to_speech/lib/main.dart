import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

final _controller = TextEditingController();
final FlutterTts flutterTts = FlutterTts();
void initState() {
  _controller.text = "";
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 500,
          title: Text("TEXT TO SPEECH"),
          titleSpacing: 10,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
            ),
            TextField(
              controller: _controller,
            ),
            TextButton(onPressed: _speak, child: Text("speak"))
          ],
        ),
      ),
    );
  }

  Future _speak() async {
    if (_controller.text == "") {
      return;
    }
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(_controller.text);
  }
}
