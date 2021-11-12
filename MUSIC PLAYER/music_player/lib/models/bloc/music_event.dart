import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class FetchMusic extends MusicEvent{

    String queryAPI;
    FetchMusic(this.queryAPI);
 
  @override
  List<Object> get props =>[];
  
}

