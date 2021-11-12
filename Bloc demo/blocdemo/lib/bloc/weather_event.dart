import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}


class GetWeather extends WeatherEvent{

  String cityName;

  GetWeather(this.cityName);

  @override
  // TODO: implement props
  List<Object> get props => null;
}
