
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flare/src/sflite_home.dart';

void main() {
  runApp(MaterialApp(
    home: Flarer(),
  ));
}
class Flarer extends StatefulWidget {
  @override
  _FlarerState createState() => _FlarerState();
}


class _FlarerState extends State<Flarer> {
  bool error=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: FlareActor(
            'flares/Form_Actor.flr',
            animation: error ? 'Error' : 'Idle',
          ),
        ),
        floatingActionButton: RaisedButton.icon(
          label: Text('Animate'),
          icon: error ?Icon(Icons.play_arrow) : Icon(Icons.pause),
          onPressed: (){
            setState(() {
              error = !error;
            });
          var sqfroute =  MaterialPageRoute(
builder: (context) => SqfliteHome(),
                           );
                      Navigator.of(context).push(sqfroute);
                    },
                  ),
                ),
    );
            }
          }
