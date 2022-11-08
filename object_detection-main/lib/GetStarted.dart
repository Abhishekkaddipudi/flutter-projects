import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text(
              "FAPP-OTD",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: width * 0.8,
                    height: height * 0.3,
                    child: Image.asset("assets/Profile.png")),
                SizedBox(height: 20),
                Text(
                  "Let's Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Flutter appliction which uses openCV tensorflow and dart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(
                      (width * 0.1944444),
                      (height * 0.015625),
                      (width * 0.1944444),
                      (height * 0.015625)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "Login");
                  },
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "SignUp");
                    },
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                    ))
              ]),
            ),
          ),
        ));
  }
}
