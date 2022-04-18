import 'package:flutter/material.dart';

class Moods extends StatefulWidget {
  const Moods({Key? key}) : super(key: key);

  @override
  State<Moods> createState() => _MoodsState();
}

class _MoodsState extends State<Moods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        title: Text("   Mood Selection"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color.fromARGB(255, 228, 26, 26),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    Navigator.pushNamed(context, "happy");
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/happy.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Happy",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color.fromARGB(255, 40, 138, 69),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    Navigator.pushNamed(context,'sad' );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/sad.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Sad",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color.fromARGB(255, 51, 207, 255),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/calm.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Calm",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
