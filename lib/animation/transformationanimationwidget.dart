import 'package:flutter/material.dart';

class TransformationAnimationWidget extends StatefulWidget {
  @override
  TransformationAnimationWidgetState createState() =>
      TransformationAnimationWidgetState();
}

class TransformationAnimationWidgetState
    extends State<TransformationAnimationWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> transitionTween;
  Animation<BorderRadius> borderRadius;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
           _controller.forward(from: 0.0);
        }
      });

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: new Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                width: transitionTween.value,
                height: transitionTween.value,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: borderRadius.value,
                ),
              ),
            ));
      },
    );
  }
}