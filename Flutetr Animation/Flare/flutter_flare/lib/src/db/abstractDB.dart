import 'package:flutter_flare/src/model.dart';
import 'package:sqflite/sqflite.dart';

abstract class Sqflitedb{
  //to create singleton  DB
  Future<Database> createdb();
        Future<Database> initdb();
       

  //? This function will be insert user in db
  Future<void> insert(Person person);

  //? This function will be update user in db
 Future<void> updatep(String _curname,int salary, Person person);

  

}