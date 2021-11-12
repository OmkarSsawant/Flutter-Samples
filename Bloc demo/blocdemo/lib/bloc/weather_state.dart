import 'package:blocdemo/model/weather.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {

  @override
  List<Object> get props => [];
}
class WeatherLoading extends WeatherState{

  @override
  // TODO: implement props
  List<Object> get props => null;
  
}
class WeatherLoaded extends WeatherState{
  final Weather weather;

  WeatherLoaded(this.weather);
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}