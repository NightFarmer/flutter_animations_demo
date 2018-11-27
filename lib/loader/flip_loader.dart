import 'package:flutter/material.dart';
import 'dart:math';

class FilpLoader extends StatefulWidget {
  final Color loaderBackground;
  final Color iconColor;
  final IconData icon;
  final String animationType;
  final String shape;
  final bool rotateIcon;

  const FilpLoader(
      {Key key,
      this.loaderBackground = Colors.redAccent,
      this.iconColor = Colors.white,
      this.icon = Icons.sync,
      this.animationType = "half_flip",
      this.shape = "square",
      this.rotateIcon = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FilpLoaderState(this.loaderBackground, this.iconColor, this.icon,
        this.animationType, this.shape, this.rotateIcon);
  }
}

class FilpLoaderState extends State<FilpLoader>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotationHorizontal;
  Animation<double> rotationVertical;
  Color loaderColor;
  Color iconColor;
  IconData icon;
  Widget loaderIconChild;
  String animationType;
  String shape;
  bool rotateIcon;
  FilpLoaderState(this.loaderColor, this.iconColor, this.icon,
      this.animationType, this.shape, this.rotateIcon);
  @override
  void initState() {
    super.initState();
    controller = createAnimationController(animationType);
    controller.addStatusListener((status) {
      // Play animation backwards and forwards for full flip
      if (animationType == "half_flip") {
        if (status == AnimationStatus.completed) {
          setState(() {
            controller.repeat();
          });
        }
      }
      // play animation on repeat for half flip
      else if (animationType == "full_flip") {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            controller.forward();
          });
        }
        if (status == AnimationStatus.completed) {
          setState(() {
            controller.repeat();
          });
        }
      }
      // custom animation state
      else {
        print("TODO not sure yet");
      }
    });
    controller.forward();
  }

  AnimationController createAnimationController([String type = 'full_flip']) {
    AnimationController animationController;
    switch (type) {
      case "half_flip":
        animationController = AnimationController(
            duration: Duration(milliseconds: 4000), vsync: this);
        this.rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.0, 0.50, curve: Curves.linear)));

        // Vertical animation
        this.rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.50, 1.0, curve: Curves.linear)));
        break;
      case "full_flip":
        animationController = AnimationController(
            duration: Duration(milliseconds: 4000), vsync: this);
        this.rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.50, 1.0,
                    curve: Interval(0.5, 1.0, curve: Curves.linear))));

        // Vertical animation
        this.rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.50, 1.0,
                    curve: Interval(0.5, 1.0, curve: Curves.linear))));
    }
    return animationController;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (animationType == "half_flip") {
      return buildHalfFlipper(context);
    } else {
      return buildFullFlipper(context);
    }
  }

  Widget buildHalfFlipper(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          return Container(
            child: new Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.005)
                ..rotateX(sin(2 * pi * rotationVertical.value))
                ..rotateY(sin(2 * pi * rotationHorizontal.value)),
              alignment: Alignment.center,
              child: new Container(
                decoration: BoxDecoration(
                    shape: shape == 'circle'
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    borderRadius: shape == "circle"
                        ? null
                        : new BorderRadius.all(
                            new Radius.circular(8.0),
                          ),
                    color: loaderColor),
                width: 150,
                height: 150,
                child: rotateIcon == true
                    ? new RotationTransition(
                        turns: rotationHorizontal.value == 1.0
                            ? rotationVertical
                            : rotationHorizontal,
                        child: new Center(
                          child: Icon(
                            icon,
                            color: iconColor,
                            size: 20.0,
                          ),
                        ),
                      )
                    : Center(
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 20.0,
                        ),
                      ),
              ),
            ),
          );
        },
        animation: controller,
      ),
    ));
  }

  Widget buildFullFlipper(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          return Container(
            child: new Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.006)
                ..rotateX(sin(2 * pi * rotationVertical.value))
                ..rotateY(sin(2 * pi * rotationHorizontal.value)),
              alignment: Alignment.center,
              child: new Container(
                  decoration: BoxDecoration(
                      shape: shape == 'circle'
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      borderRadius: shape == "circle"
                          ? null
                          : new BorderRadius.all(
                              new Radius.circular(8.0),
                            ),
                      color: loaderColor),
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 20.0,
                    ),
                  )),
            ),
          );
        },
        animation: controller,
      ),
    ));
  }
}
