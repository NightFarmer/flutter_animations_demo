import 'package:flutter/material.dart';
import 'dart:async';

class ColorLoader extends StatefulWidget {
  ColorLoader({this.colors, this.duration});
  final List<Color> colors;
  final Duration duration;
  @override
  State<StatefulWidget> createState() {
    return ColorLoaderState(this.colors, this.duration);
  }
}

class ColorLoaderState extends State<ColorLoader>
    with SingleTickerProviderStateMixin {
  ColorLoaderState(this.colors, this.duration);
  final List<Color> colors;
  final Duration duration;
  Timer timer;
  List<ColorTween> tweenAnimations = [];
  int tweenIndex = 0;
  Animation animation;
  AnimationController controller;
  List<Animation<Color>> colorAnimations = [];
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: duration);
    for (int i = 0; i < colors.length - 1; i++) {
      tweenAnimations.add(ColorTween(begin: colors[i], end: colors[i + 1]));
    }
    tweenAnimations
        .add(ColorTween(begin: colors[colors.length - 1], end: colors[0]));
    for (int i = 0; i < colors.length; i++) {
      Animation<Color> animation = tweenAnimations[i].animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0,1,
              curve: Curves.fastOutSlowIn)));
      colorAnimations.add(animation);
    }
    tweenIndex = 0;
    timer = Timer.periodic(duration, (Timer t) {
      setState(() {
        tweenIndex = (tweenIndex + 1) % colors.length;
      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: ,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    valueColor: colorAnimations[tweenIndex],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            new Stack(
              children: <Widget>[
                Text('$tweenIndex')
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          // timer.cancel();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }
}
