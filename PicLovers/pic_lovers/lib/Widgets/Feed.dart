import 'package:flutter/material.dart';
import 'package:pic_lovers/API/Wigets/htmlWidget.dart';
import 'package:pic_lovers/API/model.dart';

class FeedWid extends StatefulWidget {
  final Model model;
  FeedWid(this.model);
  @override
  _FeedWidState createState() => _FeedWidState(this.model);
}

class _FeedWidState extends State<FeedWid> {
  final Model _model;
  _FeedWidState(this._model);
  Icon icon_like = Icon(
    Icons.favorite_border,
    color: Colors.black,
    size: 34,
  );
  bool liked = false;
  double height_container = 507;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black87,
      elevation: 7.0,
      child: Container(
        height: height_container,
        margin: const EdgeInsets.all(7.7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.0),
            color: Colors.white70,
            shape: BoxShape.rectangle),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(27),
                topRight: Radius.circular(27),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(),
                  Text(
                    _model.title.toString() ?? "Loading ...",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 177,
                  ),
                  IconButton(
                    onPressed: () {
                      print("Editing Options");
                    },
                    icon: Icon(Icons.arrow_drop_down_circle),
                  )
                ],
              ),
            ),
            Container(
              child: Image.network(
                _model.photourl ??
                    'https://cdn1.neoskosmos.com/uploads/sites/2/2017/03/Rizogalo.jpg',
                height: 390,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              child: ExpansionTile(
                title: Text(_model.title),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("\nhere will be the dex  from html"),
                      Text("\nhere will be the dex  from html"),
                      Text("\nhere will be the dex  from html"),
                      Text("\nhere will be the dex  from html"),
                      Text("\nhere will be the dex  from html"),
                      //  Descrption(_model.rawhtml),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
