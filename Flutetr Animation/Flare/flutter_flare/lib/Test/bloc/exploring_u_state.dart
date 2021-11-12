import 'package:equatable/equatable.dart';

abstract class ExploringUState extends Equatable {
  const ExploringUState();
}

class InitialExploringUState extends ExploringUState {
  @override
  List<Object> get props => [];
}
