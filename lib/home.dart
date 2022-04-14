import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_therapy/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {





  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 180),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                  color: Colors.black,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {},
                    
                    child: Container(
                      width: 190,
                    
                      padding: EdgeInsets.all(20),
                      child: Column(
                        
                        children: [
                          Image.asset(
                            "assets/emotions.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            ),
                                    
                            SizedBox(height: 6,),
                            Text("Mood",style: TextStyle(fontSize: 28, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),


                Material(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                
                  
                  color: Colors.black,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {},
                    
                    child: Container(
                      width: 190,
                    
                      padding: EdgeInsets.all(20),
                      child: Column(
                        
                        children: [
                          Image.asset(
                            "assets/musictherapy.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            ),
                                    
                            SizedBox(height: 6,),
                            Text("Therapy",style: TextStyle(fontSize: 28, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),



                

                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

