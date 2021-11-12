import 'package:flutter/material.dart';
import 'package:flutter_flare/src/db/db.dart';
import 'package:flutter_flare/src/model.dart';

class SqfliteHome extends StatefulWidget {
  @override
  _SqfliteHomeState createState() => _SqfliteHomeState();
}

class _SqfliteHomeState extends State<SqfliteHome> {
 static final TodoDB _todoDB = TodoDB();
  @override
  void initState() {
    final Person p = Person(salary: "1000", name: "New Commer ");
    _todoDB.insert(p);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomSheet: DraggableScrollableSheet(
    //  minChildSize: 0.25,
    //  maxChildSize: 1.0,
    //  initialChildSize: 100,
     key: UniqueKey(),
        builder: (BuildContext context, ScrollController controller){
             
             return Container(
               height: 500,
               width: double.infinity,
               child: FloatingActionButton(
                 backgroundColor: Colors.red,
                 onPressed: ()=> _todoDB.cleardata,
               ),
             );
        },
      ),
      body: Container(
        child: StreamBuilder(
          stream: _todoDB.person$,
          builder: (_, AsyncSnapshot<List<Person>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            var todos = snapshot.data;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(todos[index].name),
                  subtitle: Text(todos[index].salary),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _todoDB.insert(Person(salary: "New inserted 10700", name: "omkar"));
        },
        child: Text("ADDDDDD"),
      ),
    );
  }
}
