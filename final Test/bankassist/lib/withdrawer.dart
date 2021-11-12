
import 'package:bankassist/models/Transactions.dart';
import 'package:bankassist/transfers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Withdrawer extends StatefulWidget {
  @override
  _WithdrawerState createState() => _WithdrawerState();
}

class _WithdrawerState extends State<Withdrawer> {
  //for charts
  //TODO: Save this list and always add it to the Contrustor

  

  List<String> _purposes = [
    'travelling',
    'study',
    'fast food',
    'Homeie food',
    'projects',
    'other'
  ]; //TODO: sp saving
  bool stopfromwith = false;
  String _currrentpurpose = "travelling";
  TextEditingController ctrlwith = TextEditingController();
  TextEditingController ctrlpur = TextEditingController();
 

  void _showwithdrawSnakbar(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text("Successfully Withdrawed"),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            stopfromwith = true;
          });
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static String spurposesp = 'puposelist';


//Shared pref
  SharedPreferences spforddllist;
 
  
  @override
  void initState() {
  
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    spforddllist = await SharedPreferences.getInstance();
 
    load();

  }

 

  

  void load() {
    List<String> loadpur = spforddllist.getStringList(spurposesp) ?? [];

    setState(() {
      loadpur.map((String newpur) {
        _purposes.add(newpur);
      }).toList();
    });
  }

  void save() async {
    await spforddllist.setStringList(spurposesp, _purposes);
    setState(() {});
  }

  void resetpurposes() {
    spforddllist.setStringList(spurposesp, []);
    setState(() {});
  }

  String __temp;
  @override
  Widget build(BuildContext context) {
   
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
       Image.network('https://i.pinimg.com/736x/c8/d5/de/c8d5de1629576306ab32ae4fa64fcbfc.jpg'),
        Container(
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black54,
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 27.0),
              Center(
                  child: Text(
                "Enter your amount  :",
                style: TextStyle(
                    fontFamily: 'NewsCycle-Bold',
                    fontSize: 32.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 57.0),
              Container(
                margin: const EdgeInsets.all(17.0),
                child: TextField(
                  cursorColor: Colors.deepPurple,
                  controller: ctrlwith,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NewsCycle-Bold',
                          fontSize: 27,
                          letterSpacing: 5),
                      hasFloatingPlaceholder: true,
                      border: OutlineInputBorder(
                        gapPadding: 4.0,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      alignLabelWithHint: true,
                      labelText: "Amount  ₹",
                      icon: Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.white24.withOpacity(0.97),
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      10.0, // horizontal, move right 10
                      10.0, // vertical, move down 10
                    ),
                  )
                ], borderRadius: BorderRadius.circular(27.0)),
                margin: EdgeInsets.all(27.0),
                child: Center(
                  child: DropdownButton<String>(
                    items: _purposes.map((String string) {
                      return DropdownMenuItem<String>(
                          value: string,
                          child: Text(
                            string,
                            style: TextStyle(
                              fontSize: 27,
                             color: Colors.deepPurple[300],
                             fontFamily: 'NewsCycle-Bold'
                            ),
                          ));
                    }).toList(),
                    onChanged: (String val) {
                      setState(() {
                        if (val == 'other' || val != 'other') {
                          this._currrentpurpose = val;
                        } else {
                          showDialog(
                            context: context,
                           builder:(context)=> 
                              AlertDialog(
                              content: TextField(
                                controller: ctrlpur,
                                onSubmitted: (str) {
                                  setState(() {
                                    __temp = str;
                                    _currrentpurpose = str;
                                  });
                                },
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Done"),
                                  onPressed: () {
                                    setState(() {
                                      String temp = _purposes.last;
                                      _purposes.removeLast();
                                      //_currrentpurpose=__temp;
                                      //save();
                                      _purposes.add(temp);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                )
                              ],
                            ),
                          );
                        }
                      });
                    },
                    value: this._currrentpurpose,
                  ),
                ),
              ),
              SizedBox(height: 27.0),
              Container(
                  margin: EdgeInsets.all(25),
                  width: 20.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(27.0)),
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    textTheme: ButtonTextTheme.normal,
                    color: Colors.greenAccent,
                    onPressed: () {
                      _showwithdrawSnakbar(context);
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          var now = new DateTime.now();

                          var formatter = new DateFormat('dd-MM-yyyy');
                          String formatted = formatter.format(now);
                          if (!stopfromwith) {
                            //Modify list
                            //adds transfer to charts
         var routetorec = MaterialPageRoute(
                                builder: (context) => Transfers(
                                    pay: Transactions(formatted,
                                        purpose: _currrentpurpose,
                                        amount: ctrlwith.text)));
                            Navigator.of(context).push(routetorec);
                          }
                        });
                      });
                      stopfromwith = false;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text("Withdraw"),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }


  
}
