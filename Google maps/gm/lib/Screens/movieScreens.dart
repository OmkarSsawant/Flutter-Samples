import 'package:flutter/material.dart';
import 'package:gm/API/movie_model.dart';
import 'package:gm/bloc/Movie/movie_bloc.dart';
import 'package:gm/bloc/Movie/movie_event.dart';

class MoviesNow extends StatefulWidget {
  @override
  _MoviesNowState createState() => _MoviesNowState();
}

class _MoviesNowState extends State<MoviesNow> {

  final _bloc =  new MovieBLoC();
  TextEditingController _query = TextEditingController();
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
          Expanded(
            child: TextField(
              controller: _query,
            ),
          )
        ],
      ),
      body: StreamBuilder(stream: _bloc.moviesnow,

      builder: (context,AsyncSnapshot<List<Movie>> snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
          itemCount:  snapshot.data.length ?? 0,
          itemBuilder: (BuildContext context,int index){
            return movieCard(snapshot.data[index]);
          },
        );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            _bloc.movieeve.add(SearchMovie('Batman'));

        },
      ),
    ); 
    
    
    
    
  }
  movieCard(Movie movie){
     // print(movie.img_src);
    return ExpansionTile(
      title: Text(movie.title??'Loading...'),
    children: <Widget>[
      Container(
        child: Image.network(movie.img_src,fit: BoxFit.fill,)??Container(),
      ),
      SizedBox(height: 2.7,),
    Center(child: Text(movie.genre??'Loading...'),),
      SizedBox(height: 7.7,),
     Center(child: Text(movie.realesed??'Loading...'),),
      SizedBox(height: 7.7,),
     Center(child: Text(movie.director??'Loading...'),),
      SizedBox(height: 7.7,),
      Center(child: Text(movie.runtime??'Loading...'),),
      SizedBox(height: 7.7,),
      Center(child: Text(movie.year??'Loading...'),)
    ],      

    );
  }
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}