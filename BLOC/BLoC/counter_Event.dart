
//Just this abstract because we wanna take diffrent events but in same fuction and then identify which event

/*
here fun(CounterEvent event)// Event can be sent of any type bu should be accepted in same field so
abstract class comes here 
if(event == IncrementEvent){
  ++;
}
else if(event == DecrementEvent){           /* In short we can Simply Identify  which event*/
  --;
//} */
abstract class CounterEvent {

} 

class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}

