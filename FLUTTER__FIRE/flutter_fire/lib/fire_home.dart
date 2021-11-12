import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApk extends StatefulWidget {
  @override
  _FirebaseApkState createState() => _FirebaseApkState();
}

class _FirebaseApkState extends State<FirebaseApk> {
  DocumentReference store = Firestore.instance.document('users/user');

  _addinfo() {
    final data = {
      'name': 'omkar sawant',
      'date': 45,
      'birth date': DateTime.now(),
      'bussiness': true
    };

    store
        .setData(data)
        .then((data) => print("Added Succesfully ! "))
        .whenComplete(() => print("now check firebase"))
        .catchError((e) => print(e.toString()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🔥 Firebase on  Fire 🔥"),
      ),
      body: Center(
          child: Text(
        "🚧 Work in Construction 🚧 ",
        style: TextStyle(fontSize: 34.7),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addinfo(),
      ),
    );
  }
}
