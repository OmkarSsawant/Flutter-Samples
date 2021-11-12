import 'package:flutter/cupertino.dart';

class Person{
  String salary;
  String name;
  Person({@required this.salary,@required this.name});

 factory Person.fromMap(Map map){
    return Person(
      salary: map['salary'],
      name: map['name']
    );
  }

  Map toMap(){
    return {
      'salary':this.salary,
      'name':this.name
    };
  }
}