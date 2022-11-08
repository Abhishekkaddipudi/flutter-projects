import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './TakePictureScreen.dart';

late final cameras;
late final first;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  first = cameras.first;
  runApp(MaterialApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TakePictureScreen(camera: first);
  }
}
