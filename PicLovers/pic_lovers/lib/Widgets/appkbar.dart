import 'package:flutter/material.dart';




class CustomAPKBAR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        "Pic Lovers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Billabong',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
