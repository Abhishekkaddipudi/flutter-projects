import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/static%20image/static.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'realtime/live_camera.dart';

class Homepage extends StatefulWidget {
  final List<CameraDescription> cameras;
  Homepage(this.cameras);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLoggedin = false;
  Timer timer;

  checkauth() async {
    _auth.authStateChanges().listen((user) {
      print(user);
      if (user == null) {
        print("nouser");
        Navigator.pushReplacementNamed(context, "GetStarted");
      }
    });
  }

  getuser() async {
    try {
      User firebaseuser = _auth.currentUser;
      await firebaseuser?.reload();
      firebaseuser = _auth.currentUser;
      if (firebaseuser != null) {
        setState(() {
          this.user = firebaseuser;
          this.isLoggedin = true;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkauth();
    this.getuser();
  }

  signout() async {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return !isLoggedin
        ? Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Center(child: Text("please check your internet connection")),
                CircularProgressIndicator(),
                ButtonTheme(
                  minWidth: 160,
                  child: ElevatedButton(
                    child: Text("SignOut"),
                    onPressed: signout,
                  ),
                ),
              ])))
        : Scaffold(
            appBar: AppBar(
              title: Text("${user.displayName}"),
              backgroundColor: Colors.orange,
              actions: [
                TextButton(
                  child: Text(
                    "SIGNOUT",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: signout,
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.orange[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset('assets/img.png'),
                          ButtonTheme(
                            minWidth: width * 0.4,
                            child: TextButton(
                              child: Text("Detect in Image"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StaticImage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.orange[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset('assets/cam.png'),
                          ButtonTheme(
                            minWidth: width * 0.5,
                            child: TextButton(
                              child: Text("Real Time Detection"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LiveFeed(widget.cameras),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.orange[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.asset('assets/learn.png'),
                          ButtonTheme(
                            minWidth: 160,
                            child: TextButton(
                              child: Text("learn hand signs"),
                              onPressed: signout,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
