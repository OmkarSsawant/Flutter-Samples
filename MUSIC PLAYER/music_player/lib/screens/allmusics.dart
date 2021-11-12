import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/models/bloc/bloc.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/screens/music_player.dart';

class AllMusics extends StatefulWidget {
  @override
  _AllMusicsState createState() => _AllMusicsState();
}

class _AllMusicsState extends State<AllMusics> {
  static String query;
  static TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _musicBloc.dispatch(FetchMusic(""));
    super.initState();
  }

  final silverappbar = SliverAppBar(
    expandedHeight: 200,
    leading: Icon(Icons.music_note),
    floating: true,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.network(
        'http://eskipaper.com/images/best-wallpaper-2.jpg',
        fit: BoxFit.cover,
      ),
      centerTitle: true,
      title:
          Text(
            "A L L     M U S I C S",
            style: TextStyle(fontFamily: 'Lobster-Regular', fontSize: 17),
          ),
         
   
       
    ),
  );
  _showsearchBar(BuildContext context){
    return  showDialog(
      context:context,
      child: AlertDialog(
        actions: <Widget>[
          FlatButton(
            onPressed: (){
         _musicBloc.dispatch(FetchMusic(_controller.text));
            Navigator.of(context).pop();
            },
            child: Icon(Icons.done),),
          
        ],
        title: Text("Search here"),
        content: Container(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Song",
                hintText: "Enter song here",
                icon: Icon(Icons.search),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27)
                )
              ),
              onSubmitted: (song){
                  query=song;
              },
            ),
          ),
      )
    );
  }
  final _scfkey = GlobalKey<ScaffoldState>();
  bool collapsed;

  final _musicBloc = MusicBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scfkey,
      body: BlocBuilder(
        bloc: _musicBloc,
        builder: (BuildContext context, MusicState state) {
          if (state is InitialMusicState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MusicsLoadedState) {
            print("Loaded ${state.musics}");
            return _buildmusic(state.musics, context);
          }
          /*   return Center(child: CircularProgressIndicator()); */
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          print("debug Active");
          _showsearchBar(context);
        },
      ),
    );
  }

  _buildmusic(List<Music> musics, BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        silverappbar,
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(27)),
                        margin: const EdgeInsets.all(14),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'http://eskipaper.com/images/best-wallpaper-3.jpg'),
                          ),
                          contentPadding: const EdgeInsets.all(7.0),
                          title: Text(musics[index].musicname),
                          subtitle: Text(musics[index].musicsinger),
                        ),
                      ),
                      Positioned(
                        top: 27,
                        left: 300,
                        child: FloatingActionButton(
                            heroTag: 'any$index',
                            child: Icon(Icons.play_arrow),
                            backgroundColor: Colors.blueAccent,
                            elevation: 5.0,
                            tooltip: 'play',
                            onPressed: () {
                              var routetoMP = MaterialPageRoute(
                                builder: (context) =>
                                    MusicPlayerView(musics[index]),
                              );
                              Navigator.of(context).push(routetoMP);
                            }),
                      ),
                    ],
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black54,
                  ),
                ],
              );
            },
            childCount: musics.length,
          ),
        )
      ],
    );
  }

  _showdialogLIC(BuildContext context, dynamic e) {
    return showDialog(
        context: context,
        child: AlertDialog(
          actions: <Widget>[
            FlatButton(
              child: Text("Done"),
              onPressed: () => Navigator.pop(context),
            )
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Text("LOW INTERNET Connection\n \t please try Again"),
                  Text('ERROR :${e.toString()}')
                ],
              )
            ],
          ),
          title: Text("Network error"),
        ));
  }

  @override
  void dispose() {
    _musicBloc.dispose();
    super.dispose();
  }
}
