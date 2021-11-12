import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:blocdemo/model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {


    if(event is GetWeather){
      yield WeatherLoading();
      final weather= await _fetchWeather(event.cityName);
      yield WeatherLoaded(weather);
    }
  }
  _fetchWeather(String cityName){
    return Future.delayed(Duration(seconds: 2),
    (){
      return Weather(
        cityName: cityName,
        tempreture: 20 + Random().nextInt(15) * Random().nextDouble(),
      );
    });
  }
}
