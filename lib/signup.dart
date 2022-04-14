import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class MySignup extends StatefulWidget {
  const MySignup({Key? key}) : super(key: key);

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  //firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password, _fname, _lname;

  checkAuthetication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthetication();
  }

  signUp() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await FirebaseAuth.instance.currentUser!.updateDisplayName(_fname);
        }
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  bool ishidden = true;
  Icon visible = Icon(Icons.visibility_off);

  //form key
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final firstnameController = new TextEditingController();
  final secondnameController = new TextEditingController();
  final emailidController = new TextEditingController();
  final passwordsController = new TextEditingController();
  final confirmpasswordsController = new TextEditingController();

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
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 50),
                child: Text(
                  "Create Account",
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
                  top: MediaQuery.of(context).size.height * 0.15,
                  //right: 35,
                  //left: 35
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: Text(
                        "Sign Up",
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
                          child: Text("First Name")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        controller: firstnameController,
                        autofocus: false,
                        onSaved: (value) {
                          firstnameController.text = value!;
                          _fname = value;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 15, bottom: 15),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter your first name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 50),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Second Name")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: secondnameController,
                        autofocus: false,
                        onSaved: (value) {
                          secondnameController.text = value!;
                          _lname = value;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 15, bottom: 15),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter your second name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(20),
                          )),
                        ),
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
                        controller: emailidController,
                        autofocus: false,
                        onSaved: (value) {
                          emailidController.text = value!;
                          _email = value;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
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
                      ),
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
                        controller: passwordsController,
                        autofocus: false,
                        onSaved: (value) {
                          passwordsController.text = value!;
                          _password = value;
                        },
                        textInputAction: TextInputAction.next,
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 50),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Confirm Password")),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        controller: confirmpasswordsController,
                        autofocus: false,
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          confirmpasswordsController.text = value!;
                          _password = value;
                        },
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
                        signUp();
                      },
                      child: Text(
                        "      REGISTER      ",
                        style: TextStyle(letterSpacing: 2, fontSize: 15),
                      ),
                    ),
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
