// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_therapy/home.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool ishidden = true;
  Icon visible = Icon(Icons.visibility_off);
  //form key
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //for firebase authentication

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
    @override
    void initState() {
      super.initState();
      this.checkAuthentication();
    }
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String errormessage) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(("ok")),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage("assets/gradient.jpg"),
      //   fit: BoxFit.cover,
      // )),
      color: Colors.grey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  "Welcome to\nmusic therapy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontFamily: "font1",
                    //fontWeight: FontWeight.bold,

                    //letterSpacing: 2
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  //right: 35,
                  //left: 35
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: Divider(
                        color: Colors.black,
                        height: 15,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 50),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 15, bottom: 15),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(20),
                            )),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Enter Email";
                            controller:
                            emailController;
                            autofocus:
                            false;

                            onSaved:
                            (value) {
                              emailController.text = value!;
                              _email = value;
                            };
                            textInputAction:
                            TextInputAction.next;
                            keyboardType:
                            TextInputType.emailAddress;
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 50),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        obscureText: ishidden,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(top: 15, bottom: 15),
                          filled: true,
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: InkWell(
                            onTap: togglepassword,
                            child: visible,
                          ),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(20),
                          )),
                        ),
                        validator: (value) {
                          controller:
                          passwordController;
                          onSaved:
                          (value) {
                            passwordController.text = value!;
                            _password = value;
                          };
                          autofocus:
                          false;
                          textInputAction:
                          TextInputAction.done;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.black,
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, right: 80, left: 80)),
                      onPressed: () {
                        //login();
                        Navigator.pushNamed(context, "homescreen");
                      },
                      child: Text(
                        "      LOGIN      ",
                        style: TextStyle(letterSpacing: 2, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- OR -",
                      style: TextStyle(fontSize: 13.5),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign in with",
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 30, left: 30)),
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red.shade800,
                      ),
                      label: Text("Google"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "signup");
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void togglepassword() {
    if (ishidden == true) {
      ishidden = false;
      visible = Icon(Icons.visibility);
    } else {
      ishidden = true;
      visible = Icon(Icons.visibility_off);
    }
    setState(() {});
  }
}
