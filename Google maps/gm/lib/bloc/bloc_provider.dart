import 'package:flutter/material.dart';

import 'User_BLoC/counter_bloc.dart';

class BloCProvider extends InheritedWidget{
 final  CounterBLoC bLoC;
 final Widget child;

  BloCProvider({Key key,this.bLoC, this.child}):super(key:key);

  static BloCProvider of(BuildContext context){

    return (context.inheritFromWidgetOfExactType(BloCProvider) as BloCProvider);
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=> true;


  
}