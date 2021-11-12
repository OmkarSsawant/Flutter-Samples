import 'dart:async';

void main() {
  List<String> strstream = ['temp' "cdcv", 'dvdfv', 'vrdvrf'];

  final strlstream = StreamController<List<String>>();

  strlstream.sink.add(strstream);

  final filstream = strstream.where((String str) => str != 'temp').toList();


  // final neefilter = strstream.map((str)=> '$str').toString();
  

  // print(neefilter);
  // strlstream.stream.listen(print);
  print(filstream);

  // strlstream.sink.add(strstream);

  strlstream.close();
}
