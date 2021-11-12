import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class SportsNews extends StatefulWidget {


  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  static String apikey='edb3a797d47a4dcab516f2d8320d87c2';

   String url = 'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=edb3a797d47a4dcab516f2d8320d87c2';
@override
  void initState() {
    getSportsNews();
    super.initState();
  }

  
 List data;
var resbody;
 int lenght=0;
  Future<String> getSportsNews() async {
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
        title: Text("Sports"),
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
         getSportsNews();
        },
      ),
    );
  }
}