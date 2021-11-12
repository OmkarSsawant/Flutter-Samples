import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_lovers/API/model.dart';
import 'package:pic_lovers/Widgets/Feed.dart';
import 'package:pic_lovers/bloc/api_bloc.dart';
import 'package:pic_lovers/bloc/bloc.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _bloc=ApiBloc();
  @override
  void initState() {
    String url='https://api.flickr.com/services/feeds/photos_public.gne?tags=person&format=json';
    _bloc.dispatch(GetResponse(url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      
      builder: (context,ApiState state){
        if(state is ModelLoading){
          return Center(child: CircularProgressIndicator());
        }
        else if(state is ModelState)
        return _listViewofModels(state.models);
      },
    );
  }
  ListView _listViewofModels(List<Model> _posts){
    return ListView.builder(
      itemCount: _posts.length??0,
       itemBuilder: (BuildContext context,int index){
         return _getModelUI(_posts[index]);
       },
    );
  }
  _getModelUI(Model model){
    return FeedWid(model);
  }
}