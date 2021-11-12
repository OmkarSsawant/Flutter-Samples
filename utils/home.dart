import 'package:flutter/material.dart';
import 'package:instagram_clone/Feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 57,
            width: double.infinity,
            color: Colors.black.withOpacity(0.1),
            child: Material(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.photo_camera,
                        size: 35,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Instagram",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Billabong',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 117,
                      ),
                      Icon(
                        Icons.live_tv,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 35,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          FeedWid(),
        ],
      ),
    ));
  }
}
