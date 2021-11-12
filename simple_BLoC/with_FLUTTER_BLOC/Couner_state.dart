
// This will have all the information to updated when event occurs

class CounterState{

  int counter;

CounterState({this.counter});
factory CounterState.initial() => CounterState(counter: 0);

}