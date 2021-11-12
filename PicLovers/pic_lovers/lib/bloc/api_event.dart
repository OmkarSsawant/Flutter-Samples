import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class GetResponse extends ApiEvent {
  final String url;

  GetResponse(this.url);

  @override
  List<Object> get props => [this.url];
}


