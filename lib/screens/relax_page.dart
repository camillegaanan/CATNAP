import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:catnap/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RelaxPage extends StatefulWidget {
  final String id;
  final String url;

  const RelaxPage({Key key, this.url, this.id}) : super(key: key);

  @override
  _RelaxPageState createState() => _RelaxPageState();
}

class _RelaxPageState extends State<RelaxPage> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  AudioPlayer _player;
  AudioCache cache;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
    cache.load("Chama Wijnen - Let Go.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/bgimage.png'),
        fit: BoxFit.cover,
      )),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/logo.png'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 35.0, top: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Meditate and Relax',
                    textAlign: TextAlign.center,
                    style: kCursiveTextStyle,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 10.0,
                              color: Color(0xFF423786),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 255.0,
                          height: 255.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 8.0,
                              color: Color(0xFF352474),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF423786),
                          ),
                          child: IconButton(
                            splashRadius: 50.0,
                            icon: Icon(playBtn),
                            color: Colors.white,
                            iconSize: 70.0,
                            onPressed: () {
                              if (!playing) {
                                cache.play("Chama Wijnen - Let Go.mp3");
                                setState(() {
                                  playBtn = Icons.pause;
                                  playing = true;
                                });
                              } else {
                                _player.pause();
                                setState(() {
                                  playBtn = Icons.play_arrow;
                                  playing = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: TyperAnimatedTextKit(
                      speed: Duration(milliseconds: 100),
                      text: [
                        "Find what feels good.",
                        "Mindfulness allows us to live life fully.",
                        "Fully aware, fully awake, fully alive.",
                        "The best meditation is a gentle awareness."
                      ],
                      textAlign: TextAlign.center,
                      textStyle: kSmallCursiveTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
