import 'package:flutter/material.dart';

import 'app_screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{

 List<String>products=['Food Tester'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Udemy"),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(2.0),
                child:
                    RaisedButton(onPressed: () {}, child: Text("Add Product")),
 
              ),
              Center(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text("Food Paradise"),
                    ],
                    
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// void main(){
//   final  _behaviourSubject= new BehaviourSubject<int>();


//     _behaviourSubject.add(2);
//   _behaviourSubject.stream.listen(print);
    


// }

