import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:object_detection/SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email, _password;

  checkauth() async {
    _auth.authStateChanges().listen((user) {
      print(user);
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkauth();
  }

  login() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        print(user);
        if (user != null) {}
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("error"),
            content: Text(errormessage),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ok")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.237247,
              ),
              Container(
                child: Image(
                  image: AssetImage("assets/Login.png"),
                  width: double.infinity,
                  color: Colors.orange,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: height * 0.118623,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
                  child: Form(
                      key: _formkey,
                      child: Column(children: [
                        Container(
                            child: TextFormField(
                          validator: (input) {
                            return (input.isEmpty ? "enter E-mail" : null);
                          },
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            prefixIcon: Icon(Icons.email),
                          ),
                          onSaved: (input) => _email = input,
                        )),
                        SizedBox(height: height * 0.0059311),

                        Container(
                            child: TextFormField(
                          validator: (input) {
                            return (input.isEmpty || input.length < 6
                                ? "please provide a password(min-6 char)"
                                : null);
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        )),
                        SizedBox(height: 20),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(
                              (width * 0.1944444),
                              (height * 0.015625),
                              (width * 0.1944444),
                              (height * 0.015625)),
                          onPressed: login,
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.lightBlue),
                            ))
                      ]))),
            ],
          )),
        ),
      ),
    );
  }
}
