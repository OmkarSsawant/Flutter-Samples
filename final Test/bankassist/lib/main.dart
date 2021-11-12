
import 'package:bankassist/models/thembloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home_.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
        builder: (_) => ThemeChanger(ThemeData.light()),
        child: MaterialAppwithTheme());
  }
}

class MaterialAppwithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Bank Assist',
      home: MainApp(),
    );
  }
}

/* 
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
        builder: (_) => ThemeChanger(ThemeData.light()),
        child: MaterialAppwithTheme());
  }
}

class MaterialAppwithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Bank Assist',
      home: MainAppe(),
    );
  }
}

class MainAppe extends StatefulWidget {
  @override
  _MainAppeState createState() => _MainAppeState();
}

class _MainAppeState extends State<MainAppe> {
  final TblocBloc _tbloc = TblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _tbloc,
      child: TestBLoCWid(),
    );
  }
}

class TestBLoCWid extends StatefulWidget {
  @override
  _TestBLoCWidState createState() => _TestBLoCWidState();
}

class _TestBLoCWidState extends State<TestBLoCWid> {
  static TextEditingController editingController = TextEditingController();
  static String date, purpose, amount;

  _addTransactionDialog(BuildContext context) {
    return showDialog(
        context: context,
        child: AlertDialog(
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.track_changes),
              label: Text("Done"),
              onPressed: (){
              final transactionBloc = BlocProvider.of<TblocBloc>(context);
          transactionBloc.dispatch(AddTransaction(
              Transactions(date, purpose: purpose, amount: amount)));
              },
            )
          ],
          title: Title(
            color: Colors.amber,
            child: Icon(Icons.add),
            title: "Add Transaction",
          ),
          content: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () {
                    var dateslected = showTimePicker(
                        initialTime: TimeOfDay.now(), context: context);
                    dateslected.then((dateselect) {
                      date = dateselect.format(context);
                      setState((){});
                    });
                  },
                  child: Text("select date"),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Purpose",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none ,
                      borderRadius: BorderRadius.circular(27.0)
                    ),
                  ),
                  onSubmitted: (String value) {
                    purpose = value;
                     setState(() {});
                  },
                ),
              ),
               Expanded(
                flex: 2,
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none ,
                      borderRadius: BorderRadius.circular(27.0)
                    ),
                  ),
                  onSubmitted: (String _amount) {
                    amount = _amount;
                     setState(() {});
                  },
                ),
              ),

            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: BlocListener(
              bloc: BlocProvider.of<TblocBloc>(context),
              listener: (BuildContext context, TblocState state) {
                if (state is InitialTblocState) {
                  return _loadingBar();
                } else if (state is TransactionDone) {
                  return _transfersListView(state.transfers);
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //event call to add
  //_addTransactionDialog(context);
        
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _loadingBar() {
    return LinearProgressIndicator(
      backgroundColor: Colors.yellowAccent,
      semanticsLabel: "Loading Transactions .....",
      semanticsValue: "Transactions",
    );
  }

  ListView _transfersListView(List<Transactions> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _subCard(list[index], index);
      },
    );
  }

  _subCard(Transactions transaction, int index) {
    return Dismissible(
      key: Key(transaction.hashCode.toString()),
      onDismissed: (direction) {
        //TODO:   delete bloc data LOGIC from here
        //add event call here to delete that will take transaction and
        //index
        final transactionBloc = BlocProvider.of<TblocBloc>(context);

        transactionBloc.dispatch(DeleteTransaction(index));
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
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(17),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$_date    "),
                  Expanded(
                    child: Text(
                      "| $_purpose\n",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.monetization_on,
                    size: 37,
                  ),
                  Center(
                      child: Text(
                    "      $_amount\n",
                    style: TextStyle(fontSize: 27),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
