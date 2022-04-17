import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_therapy/components/custom_list_tile.dart';

class Happy extends StatefulWidget {
  const Happy({Key? key}) : super(key: key);

  @override
  State<Happy> createState() => _HappyState();
}

class _HappyState extends State<Happy> {
  List musicList = [
    {
      'title': "Roobaroo",
      'singer': "A.R. Rahman",
      'url':
          "https://pagalsong.in/uploads/systemuploads/mp3/Rang%20De%20Basanti/Roobaroo%20-%20Rang%20De%20Basanti%20128%20Kbps.mp3",
      'cover':
          "https://stat2.bollywoodhungama.in/wp-content/uploads/2016/03/51206167.jpg"
    }
  ];

  String currentTile = "";
  String currentCover = "";
  String currentSinger = "";

  IconData btnIcon = Icons.play_arrow;

  //player
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;

  String currentSong = "";

  //seek
  Duration duration = new Duration();
  Duration position = new Duration();

  //visibility
  bool isVisible = false;

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      } else if (!isPlaying) {
        int result = await audioPlayer.play(url);
        if (result == 1) {
          setState(() {
            isPlaying = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        title: Text("   Happy Songs"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Expanded(
              child: ListView.builder(
                  itemCount: musicList.length,
                  itemBuilder: (context, index) => customListTile(
                        onTap: () {
                          audioPlayer.play(musicList[index]['url']);
                          audioPlayer.onDurationChanged.listen(((event) {
                            setState(() {
                              duration = event;
                            });
                          }));
          
                          audioPlayer.onAudioPositionChanged.listen(((event) {
                            setState(() {
                              position = event;
                            });
                          }));
          
                          // playMusic(musicList[index]['url']);
                          setState(() {
                            isVisible = !isVisible;
                            btnIcon = Icons.pause;
                            currentTile = musicList[index]['title'];
                            currentCover = musicList[index]['cover'];
                            currentSinger = musicList[index]['singer'];
                          });
                        },
                        title: musicList[index]['title'],
                        singer: musicList[index]['singer'],
                        cover: musicList[index]['cover'],
                      )),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Color(0x55212121), blurRadius: 8.0),
              ]),
              child: Column(
                children: [
                  Slider.adaptive(
                      value: position.inSeconds.toDouble(),
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) {}),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              image: DecorationImage(
                                image: NetworkImage(currentCover),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentTile,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                currentSinger,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(btnIcon),
                          iconSize: 42,
                          onPressed: () {
                            if (isPlaying) {
                              audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = false;
                              });
                            } else {
                              audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
