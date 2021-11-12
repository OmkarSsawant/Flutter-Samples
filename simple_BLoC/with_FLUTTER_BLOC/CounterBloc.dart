import 'package:bloc/bloc.dart';
import 'package:blocdemo/with_FLUTTER_BLOC/Couner_state.dart';
import 'package:blocdemo/with_FLUTTER_BLOC/Counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState.initial();
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

 @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
   final _currentState =currentState;
    if (event is IncrementEvent) {
      yield CounterState(counter: _currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: _currentState.counter - 1);
    }
  }
}
