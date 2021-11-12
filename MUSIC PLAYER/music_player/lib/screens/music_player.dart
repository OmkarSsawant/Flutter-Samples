import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/music.dart';

class MusicPlayerView extends StatefulWidget {
  final Music musictp;
  MusicPlayerView(this.musictp);
  @override
  _MusicPlayerViewState createState() => _MusicPlayerViewState(musictp);
}

class _MusicPlayerViewState extends State<MusicPlayerView> {
  final Music musicTP;
  _MusicPlayerViewState(this.musicTP);
  Duration _position = new Duration();
  Duration _duration = new Duration();
  AudioPlayer audioPlayer = AudioPlayer();
  double sliderval = 0.0;
  final _scfkeyMP = GlobalKey<ScaffoldState>();
  seekDuration(int d) {
    //jst fi=unction to covert double => int => duration
    //because duration takes int
    //and audioplayer takes duration
    setState(() {
      Duration newdur = Duration(seconds: d);
      audioPlayer.seek(newdur);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scfkeyMP,
    backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title:  Text("OS CREATIONS",
              style: TextStyle(fontFamily: 'Lobster-Regular',letterSpacing: 3, fontSize: 17,color: Colors.white,backgroundColor: Colors.white24),
              textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: ClipPath(
                  clipper: MyClippper(),
                  child: Image.network(
                    'http://eskipaper.com/images/best-wallpaper-4.jpg',
                    fit: BoxFit.cover,
                    height: 277,
                  ),
                ),
              ),
              Positioned(
                top: 127,
                left: 270,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.play_arrow,
                    size: 37,
                  ),
                  backgroundColor: Colors.orangeAccent,
                  onPressed: () => playmusic(musicTP.musicurl, context),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(musicTP.musicname,
              style: TextStyle(fontFamily: 'Lobster-Regular',letterSpacing: 3, fontSize: 47,color: Colors.white,backgroundColor: Colors.white24),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          Text(musicTP.musicsinger,
        
              style: TextStyle(fontFamily: 'Lobster-Regular',letterSpacing: 2, fontSize: 30,backgroundColor: Colors.white24),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          Text(
            musicTP.musicurl,
            style: TextStyle(fontFamily: 'Lobster-Regular', fontSize: 10),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.17),
                        offset: Offset(4, 7),
                        spreadRadius: 0)
                  ]),
              child: Column(
                children: <Widget>[
                  Slider(
                    activeColor: Colors.greenAccent,
                    label: "${_duration.inSeconds}hre LABEL",
                    inactiveColor: Colors.white,
                    value: _position.inSeconds.toDouble(),
                    min: 0.0,
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (double chd) {
                      setState(() {
                        seekDuration(chd.toInt());
                        sliderval = chd;
                      });
                    },
                  ),
                  SizedBox(height: 17),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Material(
                        color: Colors.purpleAccent,
                        shadowColor: Colors.purple,
                        elevation: 7,
                        borderRadius: BorderRadius.circular(27),
                        child: MaterialButton(
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                          
                          onPressed: () => pausemusic(context),
                        ),
                      ),
                      Material(
                        elevation: 7,

                        color: Colors.deepOrangeAccent,
                        shadowColor: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(27),
                                              child: MaterialButton(
                          child: Icon(
                            Icons.stop,
                            size: 27,
                            color: Colors.white,
                          ),
                         
                          onPressed: () => stopmusic(context),
                        ),
                      ),
                        Material(
                        elevation: 7,
                        //Otherization 2 required
                        color: Colors.redAccent,
                        shadowColor: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(27),
                                              child: MaterialButton(
                          child: Icon(
                            Icons.arrow_downward,
                            size: 27,
                            color: Colors.white,
                          ),
                         
                          onPressed: () =>null,// download logic stopmusic(context),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      )),
    );
  }

  playmusic(String url, BuildContext context) async {
    int result = await audioPlayer.play(url);
    url = "testing URL here";
    if (result == 1) {
      final SnackBar snackBar = SnackBar(
        content: Text("Playing ....  ${url.toString().substring(0, 10)}"),
        /* substring to get name of song */
        behavior: SnackBarBehavior.floating,
      );
      _scfkeyMP.currentState.showSnackBar(snackBar);
    }
  }

  pausemusic(BuildContext context) async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      final SnackBar snackBar = SnackBar(
        content: Text("Paused  || "),
        /* substring to get name of song */
        behavior: SnackBarBehavior.floating,
      );
      _scfkeyMP.currentState.showSnackBar(snackBar);
    }
  }

  stopmusic(BuildContext context) async {
    int result;

    result = await audioPlayer.stop();
    if (result == 1) {
      final SnackBar snackBar = SnackBar(
        content: Text("Stopped   [O]   "),
        /* substring to get name of song */
        behavior: SnackBarBehavior.floating,
      );
      _scfkeyMP.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    audioPlayer.positionHandler = (d) => setState(() {
          _position = d;
        });
    audioPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });
    super.initState();
  }
}

class MyClippper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var controlPoint = new Offset(size.width - 15, size.height - 20);
    var endPoint = new Offset(size.width, 0.0);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, (size.height / 2) - 20);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
