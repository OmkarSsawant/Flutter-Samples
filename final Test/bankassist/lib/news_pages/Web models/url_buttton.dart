import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  String url;
  WebScreen({Key key, this.url}) : super(key: key);

  @override
  _WebScreenState createState() => _WebScreenState(this.url);
}

class _WebScreenState extends State<WebScreen> {
  String url;
  _WebScreenState(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.limeAccent,
                Colors.redAccent.withOpacity(0.7),
                Colors.white10
              ]
            ) 
          ),
        ),
        title: Text(
          "OS CREATIONS",
          style: TextStyle(backgroundColor: Colors.black26,fontFamily: 'Damion',fontWeight: FontWeight.bold),
        ),
        elevation: 7.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ) /* implement webview */
              ),
        ],
      ),
    );
  }
}
