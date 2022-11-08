import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 500,
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_kc6xtvkm.json'),
                margin: EdgeInsets.only(right: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
