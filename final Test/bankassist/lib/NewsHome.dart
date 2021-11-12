import 'package:flutter/material.dart';

import 'news_pages/EntertainmentNews.dart';
import 'news_pages/Health.dart';
import 'news_pages/Science.dart';
import 'news_pages/Sports.dart';
import 'news_pages/business_news.dart';
import 'news_pages/technology.dart';


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
      
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('http://www.lgarabia.com/wp-content/uploads/2019/04/5-Things-that-Hinder-Business-Growth-e1531771844346.jpg'),
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
                      image: NetworkImage('http://www.sysfosolutions.com/Images/entertainment.png'),
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
                      image: NetworkImage('http://smarterware.org/wp-content/uploads/2016/09/technology1.jpg'),
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
                      image: NetworkImage('https://image.shutterstock.com/image-vector/chemistry-lab-school-class-science-260nw-1131572693.jpg'),
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
                      image: NetworkImage('http://www.kconnect.eu/sites/default/files/styles/top_teaser/public/images/health_on_the_net.jpg?itok=xdIRhd4o'),
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
                      image: NetworkImage('https://image.shutterstock.com/image-photo/huge-multi-sports-collage-soccer-260nw-650017768.jpg'),
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
      ),);
  }
}
