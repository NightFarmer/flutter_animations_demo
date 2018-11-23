import 'package:flutter/material.dart';

class AnimationBuilderTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationBuilderTestState();
  }
}

class AnimationBuilderTestState extends State<AnimationBuilderTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationBuilderTest'),
      ),
      body: new AnimatedTest(),
    );
  }
}

class AnimatedBuilderTest extends StatelessWidget {
  AnimatedBuilderTest({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Center(
              child: new Container(
              height: animation.value,
              width: animation.value,
              child: child,
              color: Colors.blueGrey,
            ),
            );
          }),
    );
  }
}

class AnimatedTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedTestState();
  }
}

class AnimatedTestState extends State<AnimatedTest>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: Duration(seconds: 2), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animation = new Tween(begin: 0.0, end:300.0).animate(curve);
    animationController.forward();
    animationController.addStatusListener((f) {
      setState(() {
        if (f == AnimationStatus.completed) {
          animationController.reverse();
        }
        if (f == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilderTest(
      animation: animation,
      child: new LogoWidget(animation: animation),
    );
  }
}

class LogoWidget extends StatelessWidget {
  LogoWidget({this.animation});
  final Animation<double> animation;
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(
        size: animation.value,
      ),
    );
  }
}
