import 'dart:math' as math;

import 'package:flutter/material.dart';

class UsingAnimationControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using animation controller"),
      ),
      body: new UsingAnimationControllerBody(),
    );
  }
}

class UsingAnimationControllerBody extends StatefulWidget {
  @override
  _UsingAnimationControllerBodyState createState() =>
      new _UsingAnimationControllerBodyState();
}

class _UsingAnimationControllerBodyState
    extends State<UsingAnimationControllerBody>
    with SingleTickerProviderStateMixin {
  static const FACE_LEFT_ANGLE = -math.pi / 2;
  static const FACE_RIGHT_ANGLE = math.pi / 2;

  AnimationController _controller;
  Animation _animation;
  Animation _animationAngle;
  double _angle = FACE_RIGHT_ANGLE;

  @override
  void initState() {
    super.initState();

    _controller =
        new AnimationController(duration: new Duration(seconds: 2), vsync: this)
          ..addListener(() {
            this.setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
              _angle = FACE_LEFT_ANGLE;
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
              _angle = FACE_RIGHT_ANGLE;
            }
          });

    Tween _tween = new AlignmentTween(
      begin: new Alignment(-1.0, 0.0),
      end: new Alignment(1.0, 0.0),
    );

    Tween _animationTween = new Tween(begin: 0.2, end: 1.0);

    _animation = _tween.animate(_controller);
    _animationAngle = _animationTween.animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Transform.rotate(
          angle: _animationAngle.value>=0.4?math.cos(_animationAngle.value):math.sin(_animationAngle.value),
          child: FractionallySizedBox(
              heightFactor: 0.2,
              widthFactor: 0.2,
              alignment: _animation.value,
              child: new Transform.rotate(
                angle: _angle,
                child: new Icon(
                  Icons.flight,
                  size: 80.0,
                ),
              )),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
