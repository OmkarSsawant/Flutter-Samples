import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Web models/url_buttton.dart';

class BusinessNews extends StatefulWidget {
  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  static String apikey = 'edb3a797d47a4dcab516f2d8320d87c2';

  String url =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=edb3a797d47a4dcab516f2d8320d87c2';
  @override
  void initState() {
    getBusinessNews();
    super.initState();
  }

  List data = [];
  getBusinessNews() async {
    return await http.get(url, headers: {'Accept': 'application/json'});
  }
  /* 
_decideWid(){
  if(data==null ){
    return Center(

      child: CircularProgressIndicator());
  }
  else{
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(data[index]["title"]??"Loading..."),
            backgroundColor: Colors.blueAccent,
            children: <Widget>[
              Container(            
                child: Image.network(data[index]["urlToImage"],fit: BoxFit.fill,),),
              Text(data[index]["author"]??"Loading..."),
             Text(data[index]["description"]??"Loading...")
            ],
          );
        },
      );
  }
} */
 double headlinefontsize=15;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Business"),
        titleSpacing: 4,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
            },
            child: Icon(Icons.business)),
      ),
      body: FutureBuilder(
          future: getBusinessNews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var fulljsondata = jsonDecode(snapshot.data.body);
            data = fulljsondata["articles"];

            return ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                Widget urlbutton = new Container();
                Widget newsimage = new Container();

                if (data[index]["urlToImage"] != null) {
                  newsimage = Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(10, 10),
                          blurRadius: 7
                        )
                      ]
                    ),
                    
                    margin: EdgeInsets.all(10.0),
                      child: Container(   
                        padding: const EdgeInsets.all(7.0),
                        child: Image.network(data[index]["urlToImage"]),
                      ));
                }
                if (data[index]["url"] != null) {
                  urlbutton = Material(
                    shadowColor: Colors.white70,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(17.0),
                      child: Text("more"),
                      onPressed: () {
                        var webroute = MaterialPageRoute(
                            builder: (context) =>
                                WebScreen(url: data[index]["url"]));
                        Navigator.of(context).push(webroute);
                      },
                    ),
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(17.7),
                    elevation: 7.0,
                  );
                }

                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                         onExpansionChanged: (expanded){
                           if(expanded){
                              headlinefontsize=22;
                              
                           }
                           else{
                                 headlinefontsize=15;
                            
                           }
                           setState(() {
                             
                           });
                         },
                        title: Text(data[index]["title"] ?? "",style: TextStyle(fontFamily:'DellaRespira',wordSpacing: 2,fontSize: headlinefontsize,fontWeight: FontWeight.bold),),
                        backgroundColor: Colors.blueGrey,
                        children: <Widget>[
                          newsimage,
                          Center(child: Text(data[index]["author"] ?? "")),
                          Container(
                           
                            
                            margin: const EdgeInsets.all(10.0),
                            child: Container(child: Center(child: urlbutton)),
                          ),
                          Container(
                            color: Colors.white54,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(data[index]["description"] ?? "",style: TextStyle(fontFamily:'NewsCycle-Regular',wordSpacing: 2,color:Colors.black,fontSize: 19,fontWeight: FontWeight.normal),),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          getBusinessNews();
        },
      ),
    );
  }
}
