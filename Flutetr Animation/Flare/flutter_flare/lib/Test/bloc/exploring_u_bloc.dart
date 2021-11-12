import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ExploringUBloc extends Bloc<ExploringUEvent, ExploringUState> {
  @override
  ExploringUState get initialState => InitialExploringUState();

  @override
  Stream<ExploringUState> mapEventToState(
    ExploringUEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
