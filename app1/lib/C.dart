import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';

class C extends StatefulWidget {
  const C({Key? key}) : super(key: key);

  @override
  _CState createState() => _CState();
}

class _CState extends State<C> {
  late CameraController _camera;
  bool _cameraInitialized = false;
  late CameraImage _savedImage;
  String res = "";
  void _initializedCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    _camera = new CameraController(cameras[0], ResolutionPreset.veryHigh);
    _camera.initialize().then((_) async {
      await _camera.startImageStream((CameraImage image) {
        _processedimage(image);
        runModels();
      });
      setState(() {
        _cameraInitialized = true;
      });
    });
  }

  loadmodels() async {
    await Tflite.loadModel(
      model: "assests/mobilenet_v1_1.0_224.tflite",
      labels: "assests/mobilenet_v1_1.0_224.txt",
    );
  }

  void _processedimage(CameraImage image) async {
    setState(() {
      _savedImage = image;
    });
  }

  void initState() {
    super.initState();
    _initializedCamera();
    loadmodels();
  }

  void dispose() async {
    _camera.dispose();
    super.dispose();
    await Tflite.close();
  }

  runModels() async {
    // ignore: unnecessary_null_comparison
    if (_savedImage != null) {
      var recognition = await Tflite.runModelOnFrame(
        bytesList: _savedImage.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: _savedImage.height,
        imageWidth: _savedImage.width,
        imageMean: 0,
        imageStd: 255,
        numResults: 1,
        threshold: 0.1,
      );

      res = "";
      recognition!.forEach((element) {
        res += element["label"] + " " + "\n\n";
      });
      setState(() {
        // ignore: unnecessary_statements
        res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    var swidth = sizes.width;
    var sheight = sizes.height;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: (_cameraInitialized)
              ? AspectRatio(
                  aspectRatio: _camera.value.aspectRatio,
                  child: CameraPreview(_camera))
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Container(
            child: SingleChildScrollView(
              child: Text(
                res,
                style: TextStyle(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                    fontSize: 30.0),
              ),
            ),
            margin: EdgeInsets.only(top: sheight / 2, left: swidth / 3)),
      ],
    );
  }
}
