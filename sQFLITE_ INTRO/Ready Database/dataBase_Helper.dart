import 'dart:html';
import 'dart:indexed_db';

import 'dart:io';

class DatabaseHelper{
  static DatabaseHelper databaseHelper;
  DatabaseHelper._createInstance();
factory DatabaseHelper(){
  if(databaseHelper==null){
  DatabaseHelper._createInstance();
  }
  return databaseHelper;
}
Future<Database> initializeDatabase()async{
  Directory directory=getApplicationDocumentsDirectory();
  String path=directory.path+'Transactions.db';
var db=await openDatabase(path,version:1,onCreate:_createDB);
return db;
}
Future<Database> get database async{
  if(database==null){
    database= await initializeDatabase();
  }
  else
  return database;

}
getTransMapList()async{
  this.db=await  this.db;
  var result=db.query(tableName,orderBy:'$date ASC');
}
String tableName='Transactions';
String colAmount='Amount';
String boool='bool';
String date='Date';
void _createDB(Database db,int version)async{
await db.execute('CREATE TABLE $tableName($date INTEGER PRIMARY KEY AUTOINCREMENT,$colAmount TEXT,$date TEXT)' );
}
}
