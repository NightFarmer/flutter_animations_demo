import 'package:flutter/material.dart';

class MaskingAnimationWidget extends StatefulWidget {
  @override
  MaskingAnimationWidgetState createState() => MaskingAnimationWidgetState();
}

class MaskingAnimationWidgetState extends State<MaskingAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> transitionTween;
  AnimationController controller;
  Animation<BorderRadius> borderadius;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    transitionTween = Tween(begin: 50.0, end: 200.0)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.ease));
    borderadius = BorderRadiusTween(
            begin: BorderRadius.circular(75.0), end: BorderRadius.circular(50.0))
        .animate(new CurvedAnimation(parent: controller, curve: Curves.ease));

    controller.forward();

    controller.addStatusListener((f) {
      setState(() {
        print(f);
        if (f == AnimationStatus.completed) {
          controller.forward(from: 0.0);
        } 
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: new AppBar(
            title: new Text('MaskingAnimationWidget'),
          ),
          body: new Center(
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: new Container(
                    alignment: Alignment.bottomCenter,
                    width: transitionTween.value,
                    height: transitionTween.value,
                    decoration: new BoxDecoration(
                        color: Colors.black12, borderRadius: borderadius.value),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
