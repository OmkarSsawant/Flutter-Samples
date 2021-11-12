import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_lovers/Widgets/Feed.dart';
import 'package:pic_lovers/Widgets/PostList.dart';
import 'package:pic_lovers/Widgets/appkbar.dart';
import 'package:pic_lovers/bloc/api_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final imagebloc =new  ApiBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context)=> imagebloc,
      child:MainHome() ,
    );
  }

  @override
  void dispose() {
    imagebloc.close();
    super.dispose();
  }
 
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(child: SafeArea(
      child: Column(
        children: <Widget>[
          CustomAPKBAR(),
          PostList(),

        ],
      ),
    ),) 
      );
  }
}



