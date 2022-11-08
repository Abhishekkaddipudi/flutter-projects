import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/realtime/bounding_box.dart';
import 'package:object_detection/realtime/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'package:flutter_tts/flutter_tts.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  final txt = TextEditingController();
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String textofclass = "";
  initCameras() async {}
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  FlutterTts flutterTts = FlutterTts();
  speak() async {
    if (txt.text == null) {
      return;
    }
    flutterTts.speak(txt.text);
  }

  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void dispose() {
    txt.dispose();

    super.dispose();
  }

  @override
  void initState() {
    loadTfModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tmp = MediaQuery.of(context).size;

    if (_recognitions != null) {
      if (_recognitions.isNotEmpty && _recognitions != []) {
        textofclass = _recognitions[0]["detectedClass"].toString();
      }
    }
    //final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Object Detection"),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            tmp.height,
            tmp.width,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: tmp.height * 0.75,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      tmp.width * 0.3, 0, tmp.width * 0.3, 0),
                  child: TextField(
                    showCursor: false,
                    controller: txt,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.orange,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (textofclass != null) {
                          txt.text = textofclass;
                        }
                      },
                      child: Text("Detect"),
                    ),
                    ElevatedButton(
                      onPressed: speak,
                      child: Text("Speak"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
