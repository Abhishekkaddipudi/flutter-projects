import 'package:flutter/material.dart';
import './C.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool screens = false;
  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    var swidth = sizes.width;
    var sheight = sizes.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("CAMERA"),
      ),
      body: (!screens)
          ? Container(
              margin: EdgeInsets.only(top: sheight / 2.45, left: swidth / 2.45),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      screens = true;
                    });
                  },
                  icon: Icon(Icons.camera_enhance)),
            )
          : C(),
    );
  }
}
