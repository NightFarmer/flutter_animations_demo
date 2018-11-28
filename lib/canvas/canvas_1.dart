import 'package:flutter/material.dart';

import 'dart:math';

class CircularProgress extends StatefulWidget {
  final double size;
  final Color circleColor;
  final Color backgroundColor;
  final Color textColor;

  const CircularProgress({
    Key key,
    @required this.size,
    this.circleColor = Colors.red,
    this.backgroundColor = Colors.black26,
    this.textColor = Colors.blue,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CircularProgressState();
  }
}

class CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  bool show = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation = new Tween(begin: 0.0, end: 360.0)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    controller.addStatusListener((status){
      if(status == AnimationStatus.completed || status == AnimationStatus.dismissed){
        show = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body:show == false?new Center(
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new CustomPaint(
              painter: new DrawCircle(widget.backgroundColor, animation.value, widget.circleColor),
              size: new Size(widget.size, widget.size),
            ),
            new Text("${(animation.value/360*100).round()}%",
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.size/5,
                fontWeight: FontWeight.w700
              ),
            ),
            
          ],
        ),
      ):new Center(
        child: Text('动画完成了'),
      )
    );
  }
}

class DrawCircle extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color color;

  DrawCircle(this.backgroundColor, this.progress, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = backgroundColor;
    paint.strokeWidth = size.width / 10;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        new Offset(size.width / 2, size.height / 2), size.width, paint);
    canvas.drawArc(new Offset(-size.width/2, -size.width/2)
  &new Size(size.width*2, size.width*2), -pi/2, progress*pi/180,
    false, paint..color = color);
  }

  @override
  bool shouldRepaint(DrawCircle oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
