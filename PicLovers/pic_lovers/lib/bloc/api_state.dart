import 'package:equatable/equatable.dart';
import 'package:pic_lovers/API/model.dart';

abstract class ApiState extends Equatable {
  const ApiState();
}

class InitialApiState extends ApiState {

  
  @override
  List<Object> get props => [];
}

class ModelLoading extends ApiState{

  //display loading there
  @override
  List<Object> get props => null;

  
}

class ModelState extends ApiState{
  final String appbarTitle;
   final List<Model> models;

   ModelState(this.models,this.appbarTitle);

  @override
  List<Object> get props => [models,appbarTitle];
  
}
