import 'package:flutter/material.dart';
import 'home.dart';
void main() =>runApp(
  MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        
        appBar: AppBar(
          actions: <Widget>[
            Icon(Icons.settings),
   /*          DropdownButton(
              items: (context,String item){

              }, */
            )
          ],
          leading: Icon(Icons.mode_comment),
          title: Text("Whatsapp"),
          centerTitle: true,
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: <Widget>[
               Tab(
                 icon: Icon(Icons.chat),
                 child: Text("Chats")),
               Tab(
                 icon: Icon(Icons.radio),
                 child:Text("Status")),
                 Tab(
                   icon:Icon(Icons.camera),
                 ),
            
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
          Chat(),
            Status(),
            //Camera(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.green,
          child: Icon(Icons.center_focus_weak),
        ),
      ),
    
    ),
  
  )
);