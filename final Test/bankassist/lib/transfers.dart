import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'models/Transactions.dart';
import 'package:shared_preferences/shared_preferences.dart';

//photo
//smash screen

class Transfers extends StatefulWidget {
  Transactions pay; 
  Transfers({Key key, this.pay}) : super(key: key);

  @override
  _TransfersState createState() => _TransfersState(pay);
}

class _TransfersState extends State<Transfers> {
  Transactions payd;
  _TransfersState(this.payd);
  List<Transactions> list = List<Transactions>();
  SharedPreferences sharedPreferences;
  static String key = '__transfers__';

  @override
  void initState() {
    initsharedPreferences();
    super.initState();
  }

  initsharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList(key, stringList); //errror here
    setState(() {});
  }

  void loadData() {
    List<String> loadlist = sharedPreferences.getStringList(key) ?? [];
    list = loadlist
        .map((item) => Transactions.fromMap(json.decode(item)))
        .toList();
    setState(() {});
  }

  _bgtransbgimage() {
    return Container(
      child: Image(
        image: NetworkImage('https://wallpaperaccess.com/full/12572.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.save),
              ),
              Expanded(
                flex: 1,
                child: Text("save"),
              )
            ],
          ),
          onPressed: () {
            setState(() {
              list.add(payd);
              saveData();
            });
          },
        ),
        appBar: AppBar(
          title: Text("Transfers"),
          centerTitle: true,
          leading: Icon(Icons.repeat),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _bgtransbgimage(),
            list.length == 0
                ? Center(
                    child: Text(
                    "No data",
                    style: TextStyle(color: Colors.white),
                  ))
                : transfersListView(),
          ],
        ));
  }

  _subCard(Transactions transaction) {
    return Dismissible(
      key: Key(transaction.hashCode.toString()),
      onDismissed: (direction) {
        list.remove(transaction);
        saveData();
      },
      background: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 168.0),
          child: Icon(
            Icons.delete,
            size: 34,
            color: Colors.white,
          ),
        ),
        color: Colors.red,
      ),
      child: TFCustomCard(
          transaction.date, transaction.purpose, transaction.amount),
    );
  }

  ListView transfersListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _subCard(list[index]);
      },
    );
  }
  }

class TFCustomCard extends StatelessWidget {
  String _date, _purpose, _amount;

  TFCustomCard(this._date, this._purpose, this._amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(20.0),
        borderOnForeground: true,
        color: Colors.lightBlueAccent,
        elevation: 7.5,
        child: Container(
          padding: EdgeInsets.all(7.5),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$_date  | ",style: TextStyle(fontFamily: 'digital-7',fontSize: 27,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: Text(
                      "$_purpose\n",
                      style: TextStyle(fontSize: 45,fontFamily: 'Bangers-regular'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    size: 37,
                  ),
                  Expanded(
                                      child: Center(
                        child: Text(
                      "      $_amount  ₹\n",
                      style: TextStyle(fontSize: 47,fontFamily: 'NewsCycle-Bold'),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                 Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(27),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 1,
                         color: Colors.black87,
                         offset: Offset(5, 2),
                       )
                     ]
                     ),
                     width: 70,
                     height: 30,
                     child: Icon(Icons.verified_user,color: Colors.black,size: 37,),
                   ),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
