import 'package:flutter/material.dart';
import 'dart:math';
class Canvas2 extends StatefulWidget {
  _Canvas2State createState() => _Canvas2State();
}

class _Canvas2State extends State<Canvas2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas2'),
      ),
      body: new Center(
        child: new CustomPaint(
        foregroundPainter:DrawDemo(),
        size: Size(100.0, 0.0),
      ),
      )
    );
  }
}

class DrawDemo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    var paint1 = new Paint();
    var path = new Path();
    var path1 = new Path();
    path.arcTo(Offset(-22,-15.0)&Size(40.0, 40.0), -0.05*pi, -2.9*pi/2, false);
    path1.arcTo(Offset(112,-15.0)&Size(40.0, 40.0), 1.05*pi, 2.9*pi/2, false);
    paint.strokeWidth = 5;
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint1.strokeWidth = 3;
    paint1.color = Colors.black26;
    paint1.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
    canvas.drawLine(Offset(20.0,0.0), Offset(100.0,.0), paint);
    canvas.drawArc(Offset(25.0,25.0)&Size(1, 1), 0, 2*pi, false, paint);
    canvas.drawArc(Offset(95.0,25.0)&Size(1, 1), 0, 2*pi, false, paint);
    canvas.drawArc(Offset(0,0)&Size(60, 60), 0, 2*pi, false, paint);
    canvas.drawArc(Offset(70,0)&Size(60, 60), 0, 2*pi, false, paint);
    canvas.drawCircle(Offset(65.0, 40.0), 110.0, paint);
    canvas.drawArc(Offset(-20.0,25.0)&Size(100, 100), -pi*1.2, 4/pi, false, paint);
    canvas.drawArc(Offset(50.0,25.0)&Size(100, 100), -pi/4, 0.4*pi, false, paint);
    canvas.drawLine(Offset(10.0,-40.0), Offset(120.0,-40.0), paint1);
     canvas.drawLine(Offset(20.0,-30.0), Offset(110.0,-30.0), paint1);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(30.0, 80.0, 80.0, 20.0), Radius.circular(20.0)), paint);
  }

  @override
  bool shouldRepaint(DrawDemo oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
