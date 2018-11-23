import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class EasingAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EasingAnimationWidgetState();
  }
}

class EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation = Tween(begin: -1, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));
 

    animation.addStatusListener(handler);
  }
   void handler(status) {
      if (status == AnimationStatus.completed) {
        animation.removeStatusListener(handler);
        animationController.reset();
        animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Curves.fastOutSlowIn,
        ))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              
            }
          });
        animationController.forward();
      }
    }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Ease'),
          ),
          body: new Transform(
            transform: Matrix4.translationValues(animation.value * width, 0, 0),
            child: new Center(
              child: new Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black87,
                  child: Center(
                    child: Text(
                      "${animation.value}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              if (animationController.status == AnimationStatus.completed) {
                animationController.forward(from: -1.0);
              } else if (animationController.status ==
                  AnimationStatus.dismissed) {
                animationController.reverse();
              }
            },
          ),
        );
      },
    );
  }
}
