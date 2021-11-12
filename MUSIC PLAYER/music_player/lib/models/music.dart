

import 'package:flutter/foundation.dart';



class Music {

  String musicname;

  String musicurl;

  String musicsinger;

  Music({@required this.musicname,this.musicsinger,@required this.musicurl});


  Music.fromJson(Map json):
    this.musicname= json["title"],

    this.musicsinger=json["url"],

    this.musicurl=json["thumbnailUrl"];
  


}

