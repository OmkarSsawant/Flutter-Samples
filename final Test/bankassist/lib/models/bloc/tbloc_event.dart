import 'package:bankassist/models/Transactions.dart';
import 'package:equatable/equatable.dart';

abstract class TblocEvent extends Equatable {
  const TblocEvent();
}

class AddTransaction extends TblocEvent{
  Transactions transaction;

  AddTransaction(this.transaction);

  @override
  // TODO: implement props
  List<Object> get props => [this.transaction];
} 

class DeleteTransaction extends TblocEvent{
  int index;

  DeleteTransaction(this.index);

  @override
  // TODO: implement props
  List<Object> get props => [this.index];
} 