import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:music_player/models/API.dart';
import 'package:music_player/models/music.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;

List<Music> musics = [
  Music(
      musicname: "Test music1",
      musicsinger: "Arjit Singh",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
  Music(
      musicname: "Test music2",
      musicsinger: "Neha Kakkar",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"),
  Music(
      musicname: "Test music3",
      musicsinger: "Arjit Singh",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"),
  Music(
      musicname: "Test music4",
      musicsinger: "Neha Kakkar",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"),
  Music(
      musicname: "Test music5",
      musicsinger: "Arjit Singh",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3"),
  Music(
      musicname: "Test music6",
      musicsinger: "Neha Kakkar",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3"),
  Music(
      musicname: "Test music7",
      musicsinger: "Arjit Singh",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3"),
  Music(
      musicname: "Test music8",
      musicsinger: "Neha Kakkar",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3"),
  Music(
      musicname: "Test music9",
      musicsinger: "Arjit Singh",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3"),
  Music(
      musicname: "Test music10",
      musicsinger: "Neha Kakkar",
      musicurl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3"),
];

class MusicBloc extends Bloc<MusicEvent, MusicState> {
// "https://freesound.org/apiv2/search/text/?query=piano&token=$apikey"
  //static String initurl = "https://freesound.org/apiv2/search/text/";

  String work;

  @override
  MusicState get initialState => InitialMusicState();

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is FetchMusic) {
      work = await _getFullJson();
      if (work == 'Success') {
        yield MusicsLoadedState(musics);
      }
    }
  }

  Future<String> _getFullJson() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    var fulldata = json.decode(res.body);
    for (var data in fulldata) {
      musics.add(Music.fromJson(data));
    }
    return 'Success';
  }
}
