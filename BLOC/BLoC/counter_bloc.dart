import 'dart:async';

import 'counter_Event.dart';

class CounterBloc {
  int _count = 0;

  //  Stream to control counterState (ie,output to UI)

  StreamController _streamControllerofcounterState = StreamController<int>();
  // stream getter to make OUTPUT the stream  ^  public  ie, with stream
  Stream<int> get counterOut => _streamControllerofcounterState.stream;
  //stream getter to make INPUT to Stream ie, with sink (here getter private because only on events here access the state)
  StreamSink<int> get _counterIn => _streamControllerofcounterState.sink;

  //Now make streams to make diffrent events eg, increment , decrement here

  final _counterEventcontroller = StreamController<CounterEvent>();

  //Now getter to  make events public
  /*  For events we only need sinkers */ //Because there is only input in stream and output is always by stream

  Sink<CounterEvent> get counterEventsink => _counterEventcontroller.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventcontroller.stream.listen(_mapEventtoState);
  }
   void _mapEventtoState(CounterEvent event) {
    if (event is IncrementEvent) {
      _count++;
    } else 
      _count--;
    

    _counterIn.add(_count);
  }

  void dispose(){
    _counterEventcontroller.close();
    _streamControllerofcounterState.close();
  }
}
