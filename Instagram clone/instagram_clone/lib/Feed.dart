import 'package:flutter/material.dart';

class FeedWid extends StatefulWidget {
  @override
  _FeedWidState createState() => _FeedWidState();
}

class _FeedWidState extends State<FeedWid> {
  Icon icon_like = Icon(
    Icons.favorite_border,
    color: Colors.black,
    size: 34,
  );
  bool liked=false;
  double height_container=507;
  bool expanded=false;
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
                    "\t\t\t\tUsername",
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
'https://fossbytes.com/wp-content/uploads/2019/01/The-Best-Camera-Apps-For-Android.jpg',
                height: 390,
              ),
            ),
            SizedBox(
              height: 1,
            ),
           Container(child: 
           Column(
             children: <Widget>[
                Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            liked ? liked = false : liked = true;
                            if (liked) {
                              setState(() {
                                icon_like = Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 34,
                                );
                              });
                            } else {
                              setState(() {
                                icon_like = Icon(
                                  Icons.favorite_border,
                                  color: Colors.black87,
                                  size: 34,
                                );
                              });
                            }
                            setState(() {});
                          },
                          icon: icon_like),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(onPressed: (){
                            //navigate to comment page
                          },
                            icon: Icon(Icons.comment),
                          ),
                          
                          IconButton(onPressed: (){
                            //navigate to comment page
                          },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                          SizedBox(
                            width: 117,
                          ),
                            IconButton(onPressed: (){
                              //bookmark
                          },
                            icon: Icon(Icons.bookmark),
                          ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text("vnfvnj  edfdccvdcewvffvergvfvevbrfvfrevb       ",style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(
                    onTap: (){
                      expanded ? expanded=false : expanded=true;                      setState(() {
                       if (expanded) {
                         setState(() {
                         height_container=707;                            
                         });
                       } else {
                         setState(() {
                         height_container=507;                            
                         });
                       }
                      });
                    },
                    child: Text("more..."),
                  )
                    ],
                  ),
                  
             ],
           )
           
             ,)
          ],
        ),
      ),
    );
  }
}
