import 'package:flutter/material.dart';

class AnimationTut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationTut();
}

class _AnimationTut extends State<AnimationTut>
    with SingleTickerProviderStateMixin {
  final scafkey = GlobalKey<ScaffoldState>();
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
 _animation = ColorTween(
   begin:Colors.red,
   end: Colors.black
 ).animate(animationController);
 
    super.initState();
  }
Animation _animation;
  double _height = 200.0;
  Widget myWidget = Container(color:Colors.green);
  double _width = 400.0;
  double _opacity_1 = 0.5;
  double _opacity_2 = 1.0;
  bool isexpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafkey,
      appBar: AppBar(
        title: Text(
          "Animation 😎",
          textAlign: TextAlign.center,
        ),
      ),
      body:/* Center(child: animSwicth())  */ListView(children: [
        // animContainerTest(),
        // SizedBox(
        //   height: 27.0,
        // ),
        // animOpacityTest(),
        // SizedBox(
        //   height: 27.0,
        // ),
        // animCrossFade(),
        // SizedBox(
        //   height: 27.0,
        // ),
         Center(child: animSwicth()),
 SizedBox(
          height: 27.0,
        ),
       _animatedBuilder()

      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.android),
          onPressed: () {
            setState(() {
              isexpanded = !isexpanded;
              if (isexpanded) {
                   myWidget = FlutterLogo(
                  key:UniqueKey(),
                  size: 57,
                ); 
                animationController.forward();
              } else {
                 myWidget = Container(
                  key:UniqueKey(),
                  color: Colors.amberAccent,
                  height: 57,

                );
                  animationController.reverse();
              }
            });
          }),
    );
  }
Widget _animatedBuilder(){
  return Stack(
    children:[
      AnimatedBuilder(
  animation: _animation,
  builder: (BuildContext context,Widget child){
  
    return Transform.rotate(
      angle: animationController.value,
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
child:Image.network('https://miro.medium.com/max/1024/1*GcqCagN2JjXOu5THd-0zgg.jpeg'),
        height: 200,
        width: 400,
        color: _animation.value,
      ),
    );
  },
  child: myWidget,
      )
    ]
  );
}



  Widget animSwicth() {
    return  Stack(children: <Widget>[
Container(
      child: AnimatedSwitcher(
reverseDuration: Duration(seconds: 4),
switchInCurve: Curves.bounceIn,
switchOutCurve: Curves.bounceOut,
          duration: Duration(seconds: 5),
          transitionBuilder: (Widget child,Animation<double> nu){
            return RotationTransition(
              turns: nu,
            child: child,
            key: UniqueKey(),
            );
          },

          child: myWidget,
        ),
    )
    
    ],); 
  }

  Widget animCrossFade() {
    return Center(
      child: AnimatedCrossFade(
        firstChild: Icon(
          Icons.play_arrow,
          size: 75,
        ),
        secondChild: Icon(
          Icons.pause,
          size: 75,
        ),
        duration: Duration(seconds: 5),
        crossFadeState:
            isexpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }

  Widget animOpacityTest() {
    return Center(
      child: AnimatedOpacity(
        curve: Curves.bounceInOut,
        duration: Duration(seconds: 5),
        opacity: isexpanded ? _opacity_2 : _opacity_1,
        child: Image.network(
          'https://miro.medium.com/max/1024/1*GcqCagN2JjXOu5THd-0zgg.jpeg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget animContainerTest() {
    return Center(
      child: AnimatedContainer(
        //  alignment: isexpanded ? AlignmentDirectional.bottomCenter :AlignmentDirectional.topCenter,
        curve: Curves.fastOutSlowIn, //TODO: here are no. of animation pre-build
        duration: Duration(seconds: 5),
        height: isexpanded ? _height = _width = 50 : _height = _width = 400,
        width: _width,
        // child: Icon(Icons.flight,size: 57,)
        child: Image.network(
          'https://miro.medium.com/max/1024/1*GcqCagN2JjXOu5THd-0zgg.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
