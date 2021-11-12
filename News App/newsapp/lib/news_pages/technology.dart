import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class TechnologyNews extends StatefulWidget {


  @override
  _TechnologyNewsState createState() => _TechnologyNewsState();
}

class _TechnologyNewsState extends State<TechnologyNews> {
  static String apikey='edb3a797d47a4dcab516f2d8320d87c2';

   String url = 'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=edb3a797d47a4dcab516f2d8320d87c2';
@override
  void initState() {
    getTechnologyNews();
    super.initState();
  }

  
 List data;
var resbody;
 int lenght=0;
  Future<String> getTechnologyNews() async {
    var res = await http.get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
setState(() {
       resbody= json.decode(res.body);
     data=resbody["articles"];
print("DATA LENGHT :");    print(data.length);  


});
 
 return 'Success';
  }
  
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
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Technology"),
        titleSpacing: 4,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            print("\n\n\nindivtual");
    
          },
          child: Icon(Icons.business)),
      ),
      body: _decideWid(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
         getTechnologyNews();
        },
      ),
    );
  }
}