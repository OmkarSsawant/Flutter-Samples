import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Depositer extends StatefulWidget {
  @override
  _DepositerState createState() => _DepositerState();
}

class _DepositerState extends State<Depositer> {
  bool stopfromdeposit = false;
  TextEditingController ctrldep = TextEditingController();
  _bgImage() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage('https://odesza.com/wp-content/uploads/2017/08/Odesza-Backgrounds-iPhone-6-.jpg'),
    )));
  }

  void _showwithdepSnakbar(BuildContext context, String amount) {
    if (amount == null) {
      amount = '';
    }
    final SnackBar snackBar = SnackBar(
      content: Text("$amount   Successfully   deposited"),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          stopfromdeposit = true;
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  

  @override
  void initState() {
initsharedPreferences();
    super.initState();
  }
  initsharedPreferences()async{
 _read();
  }
 int value;
String balance='';
 _read() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'balance';
         value = prefs.getInt(key) ?? 0;
         if(mounted){
            setState(() {
                   balance=value.toString();
         });
         }
       
 
         //('read: $value');
      }
  _reset()async{
        final prefs = await SharedPreferences.getInstance();
        final key = 'balance';
        setState(() {
       if(prefs.containsKey(key)){
         prefs.clear();
       prefs.setInt(key, 0);
         _read();
       }
       balance='0';          
        });
  }
      _save(int dep) async {
       
        final prefs = await SharedPreferences.getInstance();
        final key = 'balance';
        value =dep + value;
        prefs.setInt(key, value);
        setState(() {
                   balance=value.toString();          
        });
         //('saved $value');
      }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _bgImage(),
        ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  elevation: 7.0,
                              child: Container(
                                width: 470,
                                padding: EdgeInsets.all(40),
                                margin: EdgeInsets.all(10),
                    color: Colors.black,
                    child: Text(balance,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue[200],fontSize: 50,fontFamily:'digital-7'),),//digital text style
                  ),
                ),
                 Container(
              margin: EdgeInsets.all(7),
              alignment: AlignmentDirectional.centerEnd,
              child:RaisedButton(
                animationDuration: Duration(microseconds: 300),
                child: Text("Reset",style: TextStyle(color: Colors.white),),
                color: Colors.red,
                elevation: 7.0,
                
                onPressed: (){
                  
                  setState(() {
                    _reset();
                    
                  });
                },
              ),
            ),
              ],
            ),
           
             SizedBox(height: 25.0),
            Center(
                child: Container(
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                  
              "Enter your amount  :",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Damion', fontSize: 38.0,fontWeight: FontWeight.bold,color: Colors.white),
            ),
                )),
            SizedBox(height: 20.0),
            TextField(
              controller: ctrldep,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  alignLabelWithHint: true,
                  labelText: "Amount",
                  icon: Icon(Icons.monetization_on)),
            ),
            SizedBox(height: 47.0),
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
                    _showwithdepSnakbar(context, ctrldep.text);
                    setState(() {
                      if (!stopfromdeposit) {
                            _save(int.parse(ctrldep.text));
                      }
                    });
                    stopfromdeposit = false;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Text("Deposit"),
                  ),
                ))
          ],
        ),
      ],
    );
   
  }
  
}
