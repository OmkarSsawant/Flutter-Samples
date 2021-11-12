import 'package:bankassist/NewsHome.dart';
import 'package:bankassist/depositor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:bankassist/models/thembloc.dart';
import 'package:bankassist/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'withdrawer.dart';

import 'package:firebase_admob/firebase_admob.dart';

//TODO:  Adds are all fine just no working with the test devices
bool nightmode = false;
const String _appid = "ca-app-pub-3339170538280192~2846645686";
const String banner_id = 'ca-app-pub-3339170538280192/2872704026';
const String intertatial_id1 = 'ca-app-pub-3339170538280192/1968500677';
//TODO: Remove during playstore release
const String intertatial_id2 = 'ca-app-pub-3339170538280192/9331931475';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  SharedPreferences mode;

  static String mode_key = 'modestore';

  int _value = 0;

  bool connectedtointernet = false;
  //for adds
  static final MobileAdTargetingInfo targetinfo = MobileAdTargetingInfo(
    //TODO: Remove for release

    nonPersonalizedAds: true,
    keywords: [
      'Games',
      'Puzzels',
      'study',
      'shopping',
      'travelling',
      'technology',
      'money',
      'food'
    ],

    childDirected: true,
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAdfnews;
  InterstitialAd interstitialAdfmode;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-3339170538280192/2872704026',
        targetingInfo: targetinfo,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          // print("Banner Event is $event");
        });
  }

  InterstitialAd createInterticialaddfnews() {
    return InterstitialAd(
        adUnitId:
            'ca-app-pub-3339170538280192/1968500677', //TODO: change id now
        targetingInfo: targetinfo,
        listener: (event) {
          // print('ISADD EVENT : $event');
        });
  }

  InterstitialAd createInterticialaddfmode() {
    return InterstitialAd(
        //TODO: another id here
        adUnitId:
            'ca-app-pub-3339170538280192/9331931475', //TODO: change id now
        targetingInfo: targetinfo,
        listener: (event) {
          // print('ISADD EVENT : $event');
        });
  }

  var subscription;
  @override
  void initState() {
    checkinternetconnection();
    streamconnection();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3339170538280192~2846645686');
    initfbmobadd();
    initsharedPreferences();
    super.initState();
  }

  streamconnection() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {
          connectedtointernet = true;
        });
      } else {
        setState(() {
          connectedtointernet = false;
        });
      }
    });
  }

  checkinternetconnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connectedtointernet = true;
      });
    } else {
      setState(() {
        connectedtointernet = false;
      });
    }
  }

  initfbmobadd() {
    bannerAd = createBannerAd()
      ..load()
      ..show();
    interstitialAdfnews = createInterticialaddfnews()..load();
    interstitialAdfmode = createInterticialaddfmode()..load();
  }

  initsharedPreferences() async {
    setState(() {});
    mode = await SharedPreferences.getInstance();

    _getmode();
  }

  _setmode(bool newmode) async {
    mode.setBool(mode_key, newmode);
    setState(() {});
  }

  _aboutDialog(BuildContext context) {
    final about = AlertDialog(
      title: Text("About"),
      elevation: 7.0,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Application name : Bank Assist"),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/icon/icon_me.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Developer : Omkar Sawant "),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(
                width: 10,
              ),
              Text("Kankavli , Sindhudurg ,Maharastra")
            ],
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    return showDialog(
      context: context,
      builder: (context) => about,
    );
  }

  _getmode() async {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    nightmode = mode.getBool(mode_key) ?? false;
    if (nightmode) {
      setState(() {
        _themeChanger.setTheme(ThemeData.dark());
      });
    }
    if (!nightmode) {
      setState(() {
        _themeChanger.setTheme(ThemeData.light());
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /*  bannerAd
      ..load()
      ..show(); */

    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              //drawer to be done
              SizedBox(
                height: 100,
              ), // <= User info
              Divider(
                height: 4,
                color: Colors.blueGrey,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.account_balance),
                title: Text("Transfers"),
                subtitle: Text("all your transfers are here"),
                onTap: () {
                  var routetoTransfers = MaterialPageRoute(
                    builder: (context) => Transfers(),
                  );
                  Navigator.of(context).push(routetoTransfers);
                },
              ),
              Divider(height: 4, color: Colors.blueGrey),
              SwitchListTile(
                value: nightmode,
                title: Text("Night Mode"),
                onChanged: (b) {
                  interstitialAdfmode = createInterticialaddfmode()
                    ..load()
                    ..show();
                  setState(() {
                    if (b) {
                      nightmode = true;
                      _themeChanger.setTheme(ThemeData.dark());
                    } else {
                      nightmode = false;
                      _themeChanger.setTheme(ThemeData.light());
                    }
                    _setmode(b);
                  });
                },
              ),
              Divider(height: 4, color: Colors.black),

              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.new_releases),
                title: Text("News"),
                subtitle: Text("get All new news "),
                onTap: () {
                  interstitialAdfnews = createInterticialaddfnews()
                    ..load()
                    ..show();
                  var routetoTransfers = MaterialPageRoute(
                    builder: (context) => NewsHome(),
                  );
                  Navigator.of(context).push(routetoTransfers);
                },
              ),
              Divider(height: 4, color: Colors.blueGrey),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.info),
                title: Text("About"),
                subtitle: Text("Developer of OS CREATIONS "),
                onTap: () {
                  setState(() {
                    _aboutDialog(context);
                  });
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Bank Assist"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Withdraw"),
                icon: Icon(Icons.cloud_download),
              ),
              Tab(
                child: Text("Deposit"),
                icon: Icon(Icons.cloud_upload),
              ),
              Tab(
                child: Text("Top News"),
                icon: Icon(Icons.trending_up),
              ),
            ],
          ),
        ),
        body: connectedtointernet
            ? TabBarView(
                children: <Widget>[
                  Withdrawer(),
                  Depositer(),
                  NewsHome(),
                  //
                ],
              )
            : Column(
                children: <Widget>[
                      Container(
                        color: Colors.red,
                    width: double.infinity,
                    height: 32.0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.signal_cellular_connected_no_internet_4_bar,color: Colors.white),
                        SizedBox(width: 10),
                        Text("Please on the internet connection",style: TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Withdrawer(),
                        Depositer(),
                        NewsHome(),
                        //
                      ],
                    ),
                  ),
              
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAdfnews?.dispose();
    interstitialAdfmode?.dispose();
    subscription.cancel();
    super.dispose();
  }
}
