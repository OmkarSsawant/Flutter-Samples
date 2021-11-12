import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gm/API/movie_model.dart';
import 'package:gm/bloc/Movie/movie_event.dart';

class MovieBLoC {
  List<Movie> movies = [];
  MovieBLoC() {
    movieEventContoller.stream.listen(_mapEventtoState);
  }

  final movieStateController = StreamController<List<Movie>>();

  Stream<List<Movie>> get moviesnow => movieStateController.stream;

  Sink<List<Movie>> get _updatemovies => movieStateController.sink;

  final movieEventContoller = StreamController<MovieEvents>();

  Sink<MovieEvents> get movieeve => movieEventContoller.sink;

  _mapEventtoState(MovieEvents event)async {
    if (event is SearchMovie) {
      await  _assignMovie(event.title);
    }
  }

  Future<void> _assignMovie(String title) async {
    int ress = await searchmovieWithTitle(title);
    print(ress);
  }

  Future<int> searchmovieWithTitle(String title) async {
    String t = title.replaceAll(' ', '%20');
    print('URL : http://www.omdbapi.com/?apikey=1d47080f&t=$t');
    var res = await http.get('http://www.omdbapi.com/?apikey=1d47080f&t=$t');

    if (res.statusCode == 200) {
      var finalres = json.decode(res.body);
      print(finalres);
        if(finalres['Responce']!='True') return -1;
      //print('Title :${finalres['Title']}');
      //print('Year :${finalres['Year']}');


      movies.add(Movie.fromMap(finalres));

      _updatemovies.add(movies);

      return 1;
    }
    return -1;
  }

  void close() {
    movieStateController.close();
    movieEventContoller.close();
  }
}
