import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtctrl=TextEditingController();
  TextEditingController mainctrl1=TextEditingController();
  TextEditingController mainctrl2=TextEditingController();

  List<Todo>todos=List<Todo>();
  SharedPreferences sharedPreferences;
  Container _showDrawerImage() {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/bd.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
  _showInputDialog(context){
    return showDialog(
      context: context,
      child: AlertDialog(
title: Text("Enter your todo to be Added"),
content: SingleChildScrollView(
  child: ListBody(
    children: <Widget>[
      TextField(
        controller: mainctrl1,
        decoration: InputDecoration(labelText: "TODO 1"),
      ),
      SizedBox(height: 5.0,),
       TextField(
        controller: mainctrl2,
        decoration: InputDecoration(labelText: "todo 1"),
      ),
    ],
  ),
),
actions: <Widget>[
  FlatButton(
    onPressed: (){
      setState(() {
        if(mainctrl1.text.isNotEmpty && mainctrl2.text.isNotEmpty){
    insertItem(Todo(task:mainctrl1.text,subtask:mainctrl2.text));  
    saveData();      
        }
      });
    },
    child: Text("ADD"),
  ),
  FlatButton(
    onPressed: (){
      Navigator.of(context).pop();
    },
    child: Text("CANCEL"),
  )
],
    ),);
  }
@override
  void initState() {
initsharedPreferences();
    super.initState();
  }
  initsharedPreferences()async{
    sharedPreferences= await  SharedPreferences.getInstance();
    loadData();
  }
  void saveData(){
    List<String> stringList = todos.map(
      (item) => json.encode(item.toMap()
    )).toList();
    sharedPreferences.setStringList('list', stringList);
  }
void loadData(){
  List<String>list=sharedPreferences.getStringList('list');
  todos=list.map((item)=>Todo.fromMap(json.decode(item))).toList();
  setState(() { });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Stack(
          children: <Widget>[
            _showDrawerImage(),
            Positioned(
              top: 100,
              left: 2,
              child: Text(
                "Omkar Sawant",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27.0,
                    fontFamily: 'fantasy',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text("Enter TODO here....", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontFamily: 'fantasy',
                    fontWeight: FontWeight.bold),),
             margin: EdgeInsets.only(top: 200),),
           Container(
             margin: EdgeInsets.only(top: 300),
             child:  TextField(
               controller: txtctrl,
          
              decoration: InputDecoration(
                hasFloatingPlaceholder: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                alignLabelWithHint: true,
              hintText:'Enter TODO here....',
              labelText: "TODO"
              ),
            ),)
          ],
        ),
      )),
      appBar: AppBar(
        title: Text("TODO app"),
      ),
      body: todos.isNotEmpty ? getListBody():buildEmptyBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
_showInputDialog(context);
        },
      ),
    );
    
  }
  Widget getListBody(){
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index){
          return getListItem(todos[index]);
          /*);*/
        },  
      );
  }
  Widget getListItem(Todo item){
    return Dismissible(
      key: Key(item.hashCode.toString()),
      onDismissed:(b){
        setState(() {
         removeItem(item); 
        });
      },
      background: Container(
        color: Colors.red,
        child: Container(
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(Icons.delete,color: Colors.white,),
        ),
      ),
          child: ListTile(
              leading: Icon(Icons.work),
              contentPadding: EdgeInsets.all(7.0),
              title: Text("${item.task}"),
              subtitle: Text("${item.subtask}"),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.green,
                onPressed: (){
                  setState(() {
                    _showInputDialog(context);
        if(mainctrl1.text.isNotEmpty && mainctrl2.text.isNotEmpty){
          editTodo(item, mainctrl1.text, mainctrl2.text);
        }
                    
                  });
                },
              ),
            ),
    );
  }
  void removeItem(Todo item){
    todos.remove(item);
    saveData();      

  }
  void insertItem(Todo item){
  todos.add(item);
    saveData();      

  }
  void editTodo(Todo item,String newTask,String newSubtask){
    item.task=newTask;
    item.subtask=newSubtask;
    saveData();      
    setState(() { });

  }
  Widget buildEmptyBody(){
    return Center(child: Text("No Data"),);
  }
}
