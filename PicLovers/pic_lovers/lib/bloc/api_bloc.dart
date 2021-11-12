import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pic_lovers/API/model.dart';
import './bloc.dart';
import 'dart:async';
class ApiBloc extends Bloc<ApiEvent, ApiState> {
  List<Model> realmodels=[
    Model('title1','url'),
    Model('title2','url'),
    Model('title3','url'),
    Model('title4','url')
  ];
  String apkbartitle='default';
  @override
  ApiState get initialState => InitialApiState();

  @override
  Stream<ApiState> mapEventToState(
    ApiEvent event,
  ) async* {
    if (event is GetResponse) {
      yield ModelLoading();
     
     //getJsonhere
//and just pass
    
    }
  }


}
