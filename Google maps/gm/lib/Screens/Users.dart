import 'package:flutter/material.dart';
import 'package:gm/bloc/Movie/video/video_playerM.dart';
import 'package:gm/bloc/User_BLoC/counter_bloc.dart';
import 'package:gm/bloc/User_BLoC/couter_event.dart';
import 'package:gm/bloc/bloc_provider.dart';
import 'package:gm/model/user.dart';
import 'package:gm/model/user_search.dart';
import 'package:rxdart/rxdart.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BloCProvider(
      bLoC: CounterBLoC(),
      child: MaterialApp(
        title: 'Flutter Streams',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: 'Flutter Streams',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _editingControllere = TextEditingController();
  TextEditingController _editingControllerp = TextEditingController();

  //final _bloc=CounterBLoC();

  CounterBLoC _bloc;
  _showDialogtoRegister(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: _editingControllere,
                  ),
                  TextField(controller: _editingControllerp)
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.recent_actors),
                  onPressed: () {
                    _incrementCounter(
                        _editingControllere.text, _editingControllerp.text);
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void _incrementCounter(String email, String password) {
    _bloc.userEventSink.add(AddUser(email, password));
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BloCProvider.of(context).bLoC;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: UserSearch()),
          )
        ],
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<List<User>>(
          stream: _bloc.getUsers,
          initialData: [],
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                  child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  return _buildUser(snapshot.data[index], index);
                },
              ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // _showDialogtoRegister(context);
            //  var route = MaterialPageRoute(
            //    builder: (context) => VideoPlayerApp(),
            //  );
            //  Navigator.of(context).push(route);
            _solve();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _solve() {
    final _bs = BehaviorSubject<List<int>>();
    
    final list = new List<int>();
    print("BehaviorSubject");
    list.add(3);
    list.add(5);
    _bs.sink.add(list);
    _bs.stream.listen(print);

    
    // _bs.stream.listen(print);


    // final _rs = ReplaySubject<int>();

    // print("ReplaySubject");
    // _bs.add(3);
    // _bs.stream.listen(print);

    // _bs.add(4);
    // _bs.stream.listen(print);

    // final _ps = PublishSubject<int>();

    // print("PublishSubject");
    // _bs.add(3);
    // _bs.stream.listen(print);

    // _bs.add(4);
    // _bs.stream.listen(print);
  }

  _buildUser(User user, int index) {
    return ListTile(
      title: Text(user.email),
      subtitle: Text(user.password),
      onLongPress: () => _bloc.userEventSink.add(RemoveUser(index)),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
