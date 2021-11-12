import 'package:flutter/material.dart';
import 'package:gm/bloc/User_BLoC/counter_bloc.dart';
import 'package:gm/model/user.dart';

class UserSearch extends SearchDelegate<User> {
  final bloc = CounterBLoC();
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print('clear here');
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.backspace),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return StreamBuilder<List<User>>(
      stream: bloc.getUsers,
      builder: (context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('No data'),
          );
        }
       //for movie API String newquery = query.replaceAll(' ','%20') ;
        final results = snapshot.data
            .where((user) => user.email.contains(query));

        return ListView(
          children: results
              .map<ListTile>((matcheeduser) => ListTile(
                    title: Text(matcheeduser.email),
                    subtitle: Text(matcheeduser.password),
                  ))
              .toList(),
        );
      },
    );
  }
  
}
