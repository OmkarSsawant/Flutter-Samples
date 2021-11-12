import 'dart:async';

import 'package:flutter_flare/src/db/db.dart';
import 'package:flutter_flare/src/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHelper {
  static SqfliteHelper client;

 SqfliteHelper._();

static  SqfliteHelper get instance => SqfliteHelper._();

 TodoDB streamofls = new TodoDB();

  static Database db;
  static const TABLE_NAME = "Persons";
  static const PERSON_NAMES = " PER";
  static const SAL_COL = "SAL_COL";
  Future<Database>  database() async {

    print("in Database creation process 😼");

    if (db == null) {
      print("Gonna make db 😅");
      return initdb();
    }

    return db;
  }

  Future<void> _oncreate(Database db, int version) async {
    await db.execute('''CREATE  TABLE $TABLE_NAME(
         id INTEGER PRIMARY KEY,
         $PERSON_NAMES TEXT , 
         $SAL_COL TEXT
            )''');
  }



  Future<Database> initdb() async {
    var dirpath = await getDatabasesPath();

    String path = join(dirpath, 'Persons.db');
    if (db == null) {
      db = await openDatabase(path, version: 1, onCreate: _oncreate);
    }
    print("Succesfully Created DB First Time ! 🚴  😄  😇  😄");

    return db;
  }

  Future<void> insertindb(Map person) async {
    print("in INSERT");
   if(client==null){
     client = SqfliteHelper.instance;
     print("client was initlized : ${client.runtimeType} ⛽");
   }
    Database fsdb = await client.database();
        await fsdb.transaction((txn)async { 
          String name  = person['name'];
          String sal = person['salary'];
      int id =     await  txn.rawInsert('''INSERT INTO $TABLE_NAME
        (
       $PERSON_NAMES,
       $SAL_COL
        )
        VALUES
        (
         "$name",
         "$sal"
        )
        ''');
    print("inserted @ $id");
        }).then((res) {
          client.getdb;
      print(res);
    }).catchError((e) {
      print('Caused Error : $e');
    });
  }

 Future<void> updatep(String _curpersonname,int salary,Person person) async{

  Database clientdb = await client.database(); 
  int count = await clientdb.rawUpdate(
    'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',//TODO: sal too
    ['New Updated Name', salary, '$_curpersonname']);
print('updated: $count');

}
 Future<void> get getdb async {
    Database fsdb = await client.database();

    List<Map> map = await fsdb.rawQuery('''SELECT * FROM $TABLE_NAME''');

    List<Person> persons = map.map((map) => Person.fromMap(map)).toList();
       if(persons.length > 0){
       streamofls.$person.add(persons);
        print("Added in straem");
       }
       else{
         print("error  in data fetching");
       }

  }

  Future<void> get cleardata async{
    Database dbref = await client.database();

    dbref.transaction((txn){
      return txn.delete(TABLE_NAME);
    }).then((onValue){
      print(onValue);
    }).catchError((onError){
      print(onError);
    });
    print("deleted Successfully !! 🚪");
  }
}
