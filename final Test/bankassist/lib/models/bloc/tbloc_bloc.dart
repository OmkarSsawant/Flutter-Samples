import 'dart:async';
import 'package:bankassist/models/Transactions.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';


List<Transactions> realTransafers; //save this list with shared prefs and shared
//can be accessed wherever just with assigned key

class TblocBloc extends Bloc<TblocEvent, TblocState> {
  @override
  TblocState get initialState => InitialTblocState();

 

  @override
  Stream<TblocState> mapEventToState(
    TblocEvent event,
  ) async* {
    if(event is AddTransaction){
      final updatedList=_addTransaction(event.transaction);
      yield TransactionDone(updatedList);
    
    }
    else if(event is DeleteTransaction){
      final updatedlist = _deleteTransaction(event.index);
      yield TransactionDone(updatedlist);
    }
  }
  List<Transactions> _addTransaction(Transactions transaction){
    realTransafers.add(transaction);
    return realTransafers;
  }
  List<Transactions> _deleteTransaction(int index){
      realTransafers.removeAt(index);
      return realTransafers;
  }
}
