import 'package:flutter/material.dart';
import 'dart:math';

class ColorLoader2 extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const ColorLoader2(
      {Key key,
      this.color1 = Colors.deepOrangeAccent,
      this.color2 = Colors.yellow,
      this.color3 = Colors.lightBlue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ColorLoader2State();
  }
}

class ColorLoader2State extends State<ColorLoader2>
    with TickerProviderStateMixin  {
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;
  @override
  void initState() {
    super.initState();
    controller1 = new AnimationController(
        duration: Duration(seconds: 2), vsync: this);
    controller2 = new AnimationController(
        duration: Duration(seconds: 3), vsync: this);
    controller3 = new AnimationController(
        duration: Duration(seconds: 4), vsync: this);
    animation1 = Tween<double>(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller1, curve: Interval(
            0.0, 1.0, curve: Curves.linear
        )));
    animation2 = Tween<double>(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller2, curve: Interval(
            0.0, 1.0, curve: Curves.decelerate
        )));
    animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller3, curve: Interval(0.0, 1.0,curve: Curves.linear),));
    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
          children: <Widget>[
            new RotationTransition(
              turns: animation1,
              child: CustomPaint(
                painter: Arc1Painter(widget.color1),
                child: new Container(
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),new RotationTransition(
              turns: animation2,
              child: CustomPaint(
                painter: Arc2Painter(widget.color2),
                child: new Container(
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),new RotationTransition(
              turns: animation3,
              child: CustomPaint(
                painter: Arc3Painter(widget.color3),
                child: new Container(
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}

class Arc1Painter extends CustomPainter {
  final Color color;
  Arc1Painter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = new Paint();
    p.color = color;
    p.strokeWidth = 2.0;
    p.strokeCap = StrokeCap.round;
    p.style = PaintingStyle.stroke;
    Rect rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(rect, 0, 0.5*pi, false, p);
    canvas.drawArc(rect, 0.6*pi, 0.8*pi, false, p);
    canvas.drawArc(rect, 1.5*pi, 0.4*pi, false, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class Arc2Painter extends CustomPainter {
  final Color color;
  Arc2Painter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = new Paint();
    p.color = color;
    p.strokeWidth = 2.0;
    p.strokeCap = StrokeCap.round;
    p.style = PaintingStyle.stroke;
    Rect rect = new Rect.fromLTWH(0.0 + (0.2*size.width)/2, 0.0 + (0.2 * size.height)/2,
    size.width - 0.2 * size.width, size.height-0.2*size.height);
    canvas.drawArc(rect, 0.0, 0.5*pi, false, p);
    canvas.drawArc(rect, 0.8*pi, 0.6*pi, false, p);
    canvas.drawArc(rect, 1.6*pi, 0.2*pi, false, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc3Painter extends CustomPainter {
  final Color color;
  Arc3Painter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = new Paint();
    p.color = color;
    p.strokeWidth = 1.5;
    p.strokeCap = StrokeCap.round;
    p.style = PaintingStyle.stroke;
    Rect rect = new Rect.fromLTWH(0.0 + (0.4*size.width)/2, 0.0 + (0.4 * size.height)/2,
    size.width - 0.4 * size.width, size.height-0.4*size.height);
    canvas.drawArc(rect, 0.0*pi, 0.9*pi, false, p);
    canvas.drawArc(rect, 1.1*pi, 0.8*pi, false, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}