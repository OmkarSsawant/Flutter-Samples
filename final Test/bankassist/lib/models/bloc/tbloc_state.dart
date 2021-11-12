import 'package:bankassist/models/Transactions.dart';
import 'package:equatable/equatable.dart';

abstract class TblocState extends Equatable {
  const TblocState();
}

class InitialTblocState extends TblocState {
  @override
  List<Object> get props => [];
}

class TransactionDone extends TblocState{
  final List<Transactions> transfers;

  TransactionDone(this.transfers);

  @override
  // TODO: implement props
  List<Object> get props => [this.transfers];
}

