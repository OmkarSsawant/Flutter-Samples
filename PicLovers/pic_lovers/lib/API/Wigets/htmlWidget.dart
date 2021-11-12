import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'Bowser.dart';
class Descrption extends StatefulWidget {
  String html;
  Descrption(this.html);

  @override
  _DescrptionState createState() => _DescrptionState(html);
}

class _DescrptionState extends State<Descrption> {
  String htmlR;
  _DescrptionState(this.htmlR);
  @override
  Widget build(BuildContext context) {
    Html(
      data: htmlR,
      backgroundColor: Colors.black12,
      defaultTextStyle: TextStyle(color: Colors.white),
      linkStyle: TextStyle(
          color: Colors.lightBlue, decorationStyle: TextDecorationStyle.dashed),
      customRender: (node, children) {
        if (node is dom.Element) {
          switch (node.localName) {
            case 'p':
              return Column(
                children: children,
              );
            case 'img':
              return Container();
            case 'br':
              return Text('\n');
          }
        }
      },
      onLinkTap: (url){
        var routetoBrowser = MaterialPageRoute(
          builder: (context) => CustomBrowser(url),
        );
       Navigator.push(context, routetoBrowser);
      },
    );
  }
}
