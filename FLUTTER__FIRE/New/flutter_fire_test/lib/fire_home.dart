import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mlkit/mlkit.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FirebaseApk extends StatefulWidget {
  @override
  _FirebaseApkState createState() => _FirebaseApkState();
}

class _FirebaseApkState extends State<FirebaseApk> {
  DocumentReference store = Firestore.instance.document('users/user');

  DocumentReference group_store = Firestore.instance.document('groups/group');
/* 
  _addinfo() {
    Map<String, dynamic> data = {
      'name': 'omkar  S sawant',
      'date': 45,
      'birth date': DateTime.now(),
      'bussiness': true
    };
    Map<String, dynamic> data2 = {
      'group name': 'OS Warrious',
      'date': 45,
      'birth date': DateTime.now(),
      'bussiness': true
    };

    store
        .setData(data)
        .then((data) => print("Added Succesfully ! "))
        .whenComplete(() => print("now check firebase"))
        .catchError((e) => print(e.toString()));

    group_store
        .setData(data2)
        .then((data) => print("Added Succesfully F2! "))
        .whenComplete(() => print("now check firebase"))
        .catchError((e) => print(e.toString()));
    group_store
        .setData(data)
        .then((data) => print("Added Succesfully F2! "))
        .whenComplete(() => print("now check firebase !!"))
        .catchError((e) => print(e.toString()));
  }
 */
  File _file;
String foundtext="";
  VisionText text;
  final textDetector = FirebaseVision.instance.textRecognizer();
  _getImage() async {
    File  img = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );     
              final visionimage = FirebaseVisionImage.fromFile(img);
       text = await textDetector.processImage(visionimage);



for(TextBlock blocks in text.blocks){
  for(TextLine line in blocks.lines){
    print(line.text);
  }
}
        }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🔥 Firebase on  Fire 🔥"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.document('users/user').snapshots,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
          return ListTile(
            title: Text(snap.data['date'].toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
      ),
    );
  }
}