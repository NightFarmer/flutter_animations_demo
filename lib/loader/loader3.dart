import 'package:flutter/material.dart';
import 'dart:math';

class ColorLoader3 extends StatefulWidget {
  final double radius;
  final double dotRadius;

  const ColorLoader3({Key key, this.radius = 30.0, this.dotRadius = 3.0});
  @override
  State<StatefulWidget> createState() {
    return ColorLoader3State();
  }
}

class ColorLoader3State extends State<ColorLoader3>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  AnimationController controller;
  List<Color> lists = [
    Colors.lightBlueAccent,
    Colors.amber,
    Colors.deepOrangeAccent,
    Colors.pinkAccent,
    Colors.purple,
    Colors.yellow,
    Colors.lightGreen,
    Colors.orangeAccent,
    Colors.blueAccent
  ];
  double radius;
  double dotRadius;
  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    dotRadius = widget.dotRadius;
    controller = AnimationController(
        duration:const Duration(milliseconds: 3000),
        lowerBound: 0.0,
        upperBound: 1.0,
        vsync: this);
    animation_rotation =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
    ));
    animation_radius_in =
        Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
    ));
    animation_radius_out =
        Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
    ));
    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * animation_radius_in.value;
        } else if (controller.value <= 0.25 && controller.value >= 0.0) {
          radius = widget.radius * animation_radius_out.value;
        }
      });
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('complete');
      }
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loader'),
      ),
      body:new Container(
        color: Colors.black,
        child: new Center(
          child: new RotationTransition(
            turns: animation_rotation,
            child: new Container(
              child: new Center(
                child: new Stack(
                  children: lists.map((c) {
                    var index = lists.indexOf(c);
                    if (index == 0) {
                      return new Transform.translate(
                        offset: Offset(0.0, 0.0),
                        child: Dot(
                          radius: radius,
                          color: c,
                        ),
                      );
                    } else {
                      return new Transform.translate(
                        offset: Offset(radius * (cos(index.toDouble() * pi / 4)),
                            radius * (sin(index.toDouble() * pi / 4))),
                        child: Dot(
                          radius: dotRadius,
                          color: c,
                        ),
                      );
                    }
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
