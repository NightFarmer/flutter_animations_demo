import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimatedFabState();
  }
}

class AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  final double expandedSize = 180.0;
  final hiddenSize = 20.0;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new ColorTween(begin: Colors.pink, end: Colors.pink[800])
        .animate(controller);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: new AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(Icons.check_circle,0.0),
              _buildOption(Icons.flash_on,-pi/3),
              _buildOption(Icons.error_outline,-2*pi/3),
              _buildOption(Icons.access_time,pi),
              _buildFabCore(),
            ],
          );
        }, animation: controller,
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size = hiddenSize + (expandedSize - hiddenSize) * controller.value;
    return new Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    if (controller.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (controller.value > 0.8) {
      iconSize = 26.0 * (controller.value - 0.8) * 5;
    }
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new Padding(
          padding: EdgeInsets.only(top:8.0),
          child: new IconButton(
            onPressed: _onIconClick,
            icon: new Transform.rotate(
              angle: -angle,
              child: new Icon(icon, color: Colors.white),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: new EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }
  Widget _buildFabCore(){
    double scaleFactor = 2 * (controller.value - 0.5).abs();
    return new FloatingActionButton(
      onPressed: _onFabTap,
      child: new Transform(
        alignment: Alignment.center,
        transform: new Matrix4.identity()..scale(1.0,scaleFactor),
        child: new Icon(
          controller.value > 0.5?Icons.close: Icons.filter_list,
          color: Colors.white,
          size: 26.0,
        ),
      ),
      backgroundColor: animation.value,
    );
  }
  open() {
    if (controller.isDismissed) {
      controller.forward();
    }
  }

  close() {
    if (controller.isCompleted) {
      controller.reverse();
    }
  }

  _onFabTap() {
    if (controller.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconClick() {
    widget.onClick();
    close();
  }
}
