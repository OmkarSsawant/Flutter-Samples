
import 'package:bm/record.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
	DatabaseHelper helper = DatabaseHelper();
Record record;
void updatelist(){
  record.amount=ctrl1.text;
  record.purpose=ctrl2.text;
}

	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}
void _save() async {

		record.date = DateFormat.yMMMd().format(DateTime.now());
		int result;
		if (record.id != null) {  // Case 1: Update operation
			result = await helper.updateNote(record);
		} else { // Case 2: Insert Operation
			result = await helper.insertNote(record);
		}
    
		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Note Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Note');
		}

	}
  
	void _delete() async {
Navigator.pop(context);
		// Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
		// the detail page by pressing the FAB of NoteList page.
		if (record.id == null) {
			_showAlertDialog('Status', 'No Note was deleted');
			return;
		}

		// Case 2: User is trying to delete the old note that already has a valid ID.
		int result = await helper.deleteNote(record.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Note Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Note');
		}
	}
 List<String> _map = [ ];
  TextEditingController ctrl1=TextEditingController();
  TextEditingController ctrl2=TextEditingController();

  List<String> _dym = [ ]; 
   createAlertDialog(BuildContext context){
     var diAlog=AlertDialog(
       title: Text("sample"),

       content: Column(
         children: <Widget>[
           TextField(
             decoration: InputDecoration(
                labelText: "Amount",
                hintText: "Enter the Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
              ),
             controller: ctrl1,
           ),
           SizedBox(height: 10.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Purpose",
                hintText: "Enter the Purpose",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )
              ),
             controller: ctrl2,
           ),
         ],
       ),
       actions: <Widget>[
         MaterialButton(
           onPressed: (){
             setState(() {
               _map.add(ctrl1.text); 
               _dym.add(ctrl2.text);
               updatelist();
               Navigator.of(context).pop();
             });
           },
           elevation: 7.0,

           child: Text("ADD"),
         ),
          MaterialButton(
           onPressed: (){
             Navigator.of(context).pop();
           },
           elevation: 7.0,
           child: Text("CANCEL"),
         )
       ],
     );
     showDialog(
       context: context,
       builder: (context){
         return diAlog;
       }
     );
   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          leading: Icon(Icons.account_balance),
          titleSpacing: 2.0,
          title: Text("Bank Manager"),
        ),
        body:
//bg image
            Container(
              
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/bg.jpg'),
                  ),
                ),
                child: Stack(
                  
                  fit: StackFit.expand,
                
                  children: <Widget>[
                    ListView.builder(
                      itemCount: _map.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(_map[index]),
                          onDismissed:(direction){
                            //removeItem(Record());
                            _map.removeAt(index);
                            _dym.removeAt(index);
                          },
                        background: Container(
                          
                          color: Colors.red,
                          child: Container(
                            margin: EdgeInsets.only(left:270),
                            child:Icon(Icons.delete,color: Colors.white,size: 46,),),
                        ),
                          child: Stack(
                          children: <Widget>[
                            Opacity(opacity: 0.5, child: Container(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.all(7.0),
                              width: 300,
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage('images/bd.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),),
                            
                           Padding(
                             padding: EdgeInsets.all(10),
                             
                             child: 
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumbs_up_down,size: 56,color: Colors.white,),
                                Column(
                                  children: <Widget>[
                              Center(child:Text(
                              " Amount :${_map[index]} ",
                              style: TextStyle(
                                backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontFamily: 'Consolas'),
                                  
                            ),),
                            SizedBox(height: 10.0,),
                             Center(child:Text(
                              " Purpose :${_dym[index]} ",
                              style: TextStyle(
                                backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontFamily: 'Consolas'),
                                  
                            ),),
                          
                                  ],
                                )
                                
                              ],
                            )
                           ),
                          ],
                        ));
                      },
                    )
                  ],
                )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
            createAlertDialog(context);
            },

          ),
      ),
      
    );
  } 
}