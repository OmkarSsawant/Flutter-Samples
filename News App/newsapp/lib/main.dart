import 'package:flutter/material.dart';

import 'news_pages/EntertainmentNews.dart';
import 'news_pages/Health.dart';
import 'news_pages/Science.dart';
import 'news_pages/Sports.dart';
import 'news_pages/business_news.dart';
import 'news_pages/technology.dart';

void main() => runApp(MaterialApp(
      home: NewsHome(),
      theme: ThemeData.dark(),
    ));

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      appBar: AppBar(
        title: Text("News"),
        titleSpacing: 4,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
           final SnackBar snackbar=SnackBar(
             content: Text("Developer OMKAR SAWANT <= DOMBIVLI"),
             duration: Duration(seconds: 5),
             elevation: 7.0,
           );
           setState(() {
             _scaffoldKey.currentState.showSnackBar(snackbar);
           });
            },
            child: Icon(Icons.insert_chart)),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/business.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Business News",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BusinessNews(),
                          ));
                    }),
              )),
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Entertainment.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Entertainment News",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EntertainmentNews(),
                          ));
                    }),
              )),
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Technology.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Technology News",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TechnologyNews(),
                          ));
                    }),
              )),
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Science.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Science News",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScienceNews(),
                          ));
                    }),
              )),
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Health.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Health News",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HealthNews(),
                          ));
                    }),
              )),
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Sports.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(27.7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.white54,
                      offset: Offset(7, 7),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: FlatButton(
                    color: Colors.transparent,
                    splashColor: Colors.amber,
                    padding: EdgeInsets.all(45.0),
                    child: Text("Sports News",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            backgroundColor: Colors.white54)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SportsNews(),
                          ));
                    }),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          //refresh
        },
      ),
    );
  }
}
