
import 'package:flutter/material.dart';

class ArtBoard extends StatefulWidget {
  @override
  _ArtBoardState createState() => _ArtBoardState();
}

class _ArtBoardState extends State<ArtBoard> {
  List<Offset> offsets = [ ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw Here ✍'),
      ),
      body: Column(
              children: [
             
  


             
                Container(
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                RenderBox thisbox = context.findRenderObject();
                Offset tappedpoint =
                    thisbox.globalToLocal(details.globalPosition);
                offsets = List.from(offsets)..add(tappedpoint-Offset(27, 27));
              });
            },
            onPanEnd: (DragEndDetails details)=> null,
            child: CustomPaint(
              painter: CanvasTd(
                controlpts: offsets,
               origin : offsets[0]
              ),
              size: Size.infinite,
            ),
          ),
        ),]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState((){offsets.clear();}),
      ),
    );
  }
}

class CanvasTd extends CustomPainter {

  List<Offset> controlpts = <Offset>[];

  Offset origin;
  CanvasTd({this.controlpts,this.origin});
  Paint _paint = Paint()
  ..color = Colors.greenAccent
  ..strokeWidth = 2
  ..strokeCap  = StrokeCap.round;
   
   Paint cpaint = new Paint()
   ..color = Colors.orangeAccent
   ..strokeWidth =7
   ..strokeCap = StrokeCap.round;

   
  @override
  void paint(Canvas canvas, Size size) {
    for(int i=0;i < controlpts.length-1 ;i++ ){
      if(controlpts[i] != null && controlpts[i+1] != null){
        canvas.drawLine(controlpts[i], controlpts[i+1], _paint);

      }
    }
   
   canvas.drawCircle(origin, 17.0, cpaint);
    
      
  }
  @override
  bool shouldRepaint(CanvasTd oldDelegate) => controlpts != oldDelegate.controlpts;
}
