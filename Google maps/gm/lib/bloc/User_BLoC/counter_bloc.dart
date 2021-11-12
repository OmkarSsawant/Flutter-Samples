import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gm/bloc/User_BLoC/couter_event.dart';
import 'package:gm/model/user.dart';
import 'package:rxdart/rxdart.dart';

class CounterBLoC {
  SharedPreferences savedusers;
  List<User> userList = [
    User('omkar18sawant@gmail.com', 'nopasswordbeta'),
  ];
  static const String key = '_users_';
  // int count=0;
  final streamcontroller =
      ReplaySubject<List<User>>(); //for State to be yielded

  Observable<List<User>> get getUsers => streamcontroller.stream;

  StreamSink<List<User>> get _addUser => streamcontroller.sink;

  final eventStreamcontroller =
      ReplaySubject<UserEvent>(); //for Events to be  taken

  Sink<UserEvent> get userEventSink => eventStreamcontroller.sink;

  CounterBLoC() {
    initLocalSP();
    eventStreamcontroller.stream.listen(_mapEventtoState);
  }
  initLocalSP() async {
    savedusers = await SharedPreferences.getInstance();

    int res1 = await _loadUsers();
    print('loaded responce :   $res1');
    int res2 = await _saveUsers();
    print('saved responce :   $res2');
  }

  Future<int> _loadUsers() async {
    var spclient = savedusers;
    if (spclient.containsKey(key)) {
      List<String> loadedUsers = spclient.getStringList(key) ?? ['no data'];

      userList =
          loadedUsers.map((user) => User.fromJson(json.decode(user))).toList();
      _addUser.add(userList);

      return 1;
    } else {
      return -1;
    }
  }

  Future<int> _saveUsers() async {
    var spclient = savedusers;

    var newUlist = userList.map((user) => json.encode(user.toJson())).toList();
    await spclient.setStringList(key, newUlist);
    return 1;
  }

  _mapEventtoState(UserEvent event)async{

    if (event is RemoveUser)
      userList.removeAt(event.index);
    else if (event is AddUser) userList.add(User(event.email, event.password));
    _addUser.add(userList);
    _saveUsers();
    _loadUsers();

  }

  void close() {
    streamcontroller.close();
    eventStreamcontroller.close();
  }
}
