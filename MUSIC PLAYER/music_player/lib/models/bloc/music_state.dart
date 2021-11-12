import 'package:equatable/equatable.dart';

import '../music.dart';

abstract class MusicState extends Equatable {
  const MusicState();
}

class InitialMusicState extends MusicState {
  @override
  List<Object> get props => [];
}
class MusicsLoadedState extends MusicState{
  List<Music> musics;
  MusicsLoadedState(this.musics);

  @override
  // TODO: implement props
  List<Object> get props => [this.musics];
}

