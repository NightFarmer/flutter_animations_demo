import 'package:flutter/material.dart';

class CurveAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurveAnimationState();
  }
}

class CurveAnimationState extends State<CurveAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurveAnimation'),
      ),
      body: new Center(
        child: new MyCurveTest(),
      ),
    );
  }
}

class MyCurveTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCurveTestState();
  }
}

class MyCurveTestState extends State<MyCurveTest>
    with SingleTickerProviderStateMixin {
  CurvedAnimation animation;
  AnimationController animationController;
  var count;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,duration: new Duration(seconds: 5));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.bounceOut);
    animationController.forward();
    animation.addListener(() {
      setState(() {
        count = animation.value;
        print(count);
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RotationTransition(
          turns: animation,
          child: new FlutterLogo(
            size: 150.0,
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        new Text('$count'),
        new Container(
          width: 20.0,
          height: 20.0,
          child: new FloatingActionButton(
            child: Icon(
              Icons.track_changes,
              size: 20.0,
            ),
            onPressed: () {
              animationController.forward(from: 0.0);
            },
          ),
        )
      ],
    );
  }
}
