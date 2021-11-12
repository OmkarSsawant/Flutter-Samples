import 'dart:async';
import 'package:flutter_flare/src/db/sqflite_a.dart';
import 'package:flutter_flare/src/model.dart';
import 'dart:math' as math;

class TodoDB {
  static SqfliteHelper db;
 
  void get cleardata {
     if(db != null){
     db.cleardata;
     }
     }
  TodoDB() {
    print(db.runtimeType);
    if (db == null) {
      db = SqfliteHelper.instance;
    }
  }

  static final random = math.Random();
  List<Person> todos = [
    Person(name: "omkar", salary: "random.nextInt(200)"),
  ];
  final persons$C = StreamController<List<Person>>();

  Sink<List<Person>> get $person => persons$C.sink;

  Stream<List<Person>> get person$ => persons$C.stream;

  void insert(Person person) {
    print("In Insert Stream Mode ⌛ ");
    todos.add(person);
    $person.add(todos);
    print("In Insert Database Mode ⌛ ");
    print(person.toMap().toString());
    var newmap = person.toMap();
    print("Coverted Successfully !!! 💃");
    db.insertindb(newmap);
    print("addded Successfully !!! 😎");
  }

  void get close {
    persons$C.close();
  }
}
