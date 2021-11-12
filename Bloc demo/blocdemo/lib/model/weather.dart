import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final String cityName;

  final double tempreture;

  Weather({@required this.cityName,@required this.tempreture}) ;

  @override
  // TODO: implement props
  List<Object> get props => [[this.cityName, this.tempreture]];
}
