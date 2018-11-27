import 'package:flutter/material.dart';

import 'dart:math';

enum DotType { square, circle, diamond, icon }

class ColorLoader4 extends StatefulWidget {
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const ColorLoader4(
      {Key key,
      this.dotOneColor = Colors.redAccent,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on)})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ColorLoader4State();
  }
}

class ColorLoader4State extends State<ColorLoader4>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(duration: widget.duration, vsync: this);
    animation_1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.7, curve: Curves.ease)));
    animation_2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.1, 0.8, curve: Curves.ease)));
    animation_3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.2, 0.9, curve: Curves.ease)));
    controller.repeat();
     controller.addListener(() {
      setState(() {
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
    return Scaffold(
      body: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Transform.translate(
              offset: Offset(
                0.0,
                -30 *
                    (animation_1.value <= 0.50
                        ? animation_1.value
                        : 1.0 - animation_1.value),
              ),
              child: new Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Dot(
                  radius: 10.0,
                  color: widget.dotOneColor,
                  type: widget.dotType,
                  icon: widget.dotIcon,
                ),
              ),
            ),
            new Transform.translate(
              offset: Offset(
                0.0,
                -30 *
                    (animation_2.value <= 0.50
                        ? animation_2.value
                        : 1.0 - animation_2.value),
              ),
              child: new Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Dot(
                  radius: 10.0,
                  color: widget.dotTwoColor,
                  type: widget.dotType,
                  icon: widget.dotIcon,
                ),
              ),
            ),
            new Transform.translate(
              offset: Offset(
                0.0,
                -30 *
                    (animation_3.value <= 0.50
                        ? animation_3.value
                        : 1.0 - animation_3.value),
              ),
              child: new Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Dot(
                  radius: 10.0,
                  color: widget.dotThreeColor,
                  type: widget.dotType,
                  icon: widget.dotIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final DotType type;
  final Icon icon;

  const Dot({Key key, this.radius, this.color, this.type, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: type == DotType.icon
          ? Icon(
              icon.icon,
              color: color,
              size: 1.3 * radius,
            )
          : new Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: selectType(type,radius),
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
  selectType(type,radius){
    if(type == DotType.circle){
      return radius;
    }
    if(type == DotType.diamond){
      return radius;
    }
    return radius*1.5;
  }
}
