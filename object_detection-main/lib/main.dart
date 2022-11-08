import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:object_detection/GetStarted.dart';
import 'package:object_detection/Homepage.dart';
import 'package:object_detection/Login.dart';
import 'package:object_detection/SignUp.dart';
import 'package:page_transition/page_transition.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    cameras = await availableCameras();
  } catch (e) {
    main();
  }
  // running the app

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Container(
            height: height,
            width: width,
            child: Image.asset('assets/start.png')),
        nextScreen: Homepage(cameras),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        pageTransitionType: PageTransitionType.fade,
      ),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "GetStarted": (BuildContext context) => GetStarted(),
      },
    );
  }
}
