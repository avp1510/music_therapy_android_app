import 'package:flutter/material.dart';
import 'package:music_therapy/home.dart';
import 'package:music_therapy/login.dart';
import 'package:music_therapy/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "login",
    routes: {"login": (context) => MyLogin(),
             "signup":(context) => MySignup(),
             "homescreen":(context) => HomeScreen(),},
  ));
}