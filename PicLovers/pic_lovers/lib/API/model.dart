const String API_URL='https://api.flickr.com/services/feeds/photos_public.gne?tags=person&format=json';
//here simply just tag should be changed
  String tag='cars';
  String searchurl='https://api.flickr.com/services/feeds/photos_public.gne?tags=$tag&format=json';

class Model{
  
  String title;

  String photourl;
  
  //String rawhtml;
Model(this.title,this.photourl/* ,this.rawhtml */);
  Model.fromJson(Map map){
    this.title = map['title'];
  this.photourl = getphotourl(map['media']);
 /*  this.rawhtml = map['description']; *///htmlWidget.dart to render
  }
  String getphotourl(map){
    String purl=map['m'];
    return purl;
  }
}