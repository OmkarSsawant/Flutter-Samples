import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String>chats=['R-ONE','Chitti','G-ONE','RA-ONE','DINESH','KARTIK'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Message(),
            ));
          },
          leading: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.all(30.0),
          title: Text("${chats[index]}"),
          subtitle: Text("busy"),
        );  
      },
    );
  }

}


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<String>chats=['R-ONE','Chitti','G-ONE','RA-ONE','DINESH','KARTIK'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context,int index){
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Message(),
            ));
          },
          leading: Icon(Icons.blur_circular),
          contentPadding: EdgeInsets.all(30.0),
          title: Text("${chats[index]}"),
          subtitle: Text("busy"),
        );  
      },
    );
  }
}


class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chat),
        title: Text("unititled"),
      ),
      //chat generation
    );
  }
}

/* 
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  
  File imageFile;
  File standbyImage;
/* _saveIamge()async{
Directory path = await getApplicationDocumentsDirectory();
final File newImage = await imageFile.copy('$path/image1.png');
} */
_openGallery(BuildContext context)async{
  var pictureGallery= await ImagePicker.pickImage(source:ImageSource.gallery);
  this.setState((){
    imageFile=pictureGallery;
  });
Navigator.of(context).pop();
}
/* _openCamera(BuildContext context)async{
  var picturecam= await ImagePicker.pickImage(source:ImageSource.camera);
  this.setState((){
    imageFile=picturecam;
  });
  Navigator.of(context).pop();
} */
_standbycam()async{
  var capture=await ImagePicker.pickImage(source: ImageSource.camera);
  this.setState((){
    standbyImage=capture;
  });
}
  Future<void>_showChoiceDialoge(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Gallery"),
          content:SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                /* GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                      //_openCamera(context);
                  },
                ), */
        SizedBox(height: 4.0,),
                 GestureDetector(
                  child: Text("Gallery"),
                  onTap: (){
                      _openGallery(context);
                  },
                ),
              ],
            ),
          ) ,
        );
      }
    );
  }
  Widget _decideImageView(){
    if (imageFile==null) {
      return _standbycam();
    } else {
          return  Image.file(imageFile,width: 400,height: 200,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                  _showChoiceDialoge(context);
              },
              child: _decideImageView(),
            ),
            FloatingActionButton(
              child: Icon(Icons.save_alt),
              onPressed: (){
                //_saveImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
 */