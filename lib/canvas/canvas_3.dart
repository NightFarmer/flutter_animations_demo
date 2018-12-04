        import 'dart:typed_data';

        import 'package:flutter/material.dart';
        import 'dart:ui' as ui;

        class Canvas3 extends StatefulWidget {
        final GlobalKey<_Canvas3State> key = GlobalKey();
        _Canvas3State createState() => _Canvas3State();
        }

        class _Canvas3State extends State<Canvas3> {
        List list = [];
        var image;
        ByteData imgBytes;
        ui.Image get rendered {
            ui.PictureRecorder recorder = ui.PictureRecorder();
            Canvas canvas = Canvas(recorder);
            DrawCanvas painter = DrawCanvas(points: list);
            var size = context.size;
            painter.paint(canvas, size);
            return recorder
                .endRecording()
                .toImage(size.width.floor(), size.height.floor());
        }

        void getImage() async {
            final rander = widget.key.currentState.rendered;
            final pngBytes = await rander.toByteData(format: ui.ImageByteFormat.png);
            setState(() {
            imgBytes = pngBytes;
            });
        }

        @override
        Widget build(BuildContext context) {
            return Container(
            child: new Scaffold(
                body: new Stack(
                children: <Widget>[
                    new GestureDetector(
                    onPanUpdate: (detail) {
                        RenderBox renderBox = context.findRenderObject();
                        Offset offset = renderBox.globalToLocal(detail.globalPosition);
                        setState(() {
                        list = new List.from(list)..add(offset);
                        });
                    },
                    onPanEnd: (detail) {
                        getImage();
                        return list.add(null);
                    },
                    ),
                    new CustomPaint(
                    painter: DrawCanvas(points: list),
                    ),
                    new Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: double.infinity,
                        // height: 50,
                        padding: EdgeInsets.all(20.0),
                        child: new Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                            FloatingActionButton(
                            child: Icon(
                                Icons.camera,
                                size: 40.0,
                            ),
                            onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                return Scaffold(
                                    appBar: AppBar(
                                    title: Text('TP'),
                                    ),
                                    body: imgBytes != null
                                        ? new Center(
                                            child: Image.memory(
                                                Uint8List.view(imgBytes.buffer)),
                                        )
                                        : new Center(
                                            child: Text('not'),
                                        ),
                                );
                                }));
                            },
                            )
                        ],
                        ),
                    ),
                    )
                ],
                ),
            ),
            );
        }
        }

        class DrawCanvas extends CustomPainter {
        final List points;

        DrawCanvas({this.points});
        @override
        void paint(Canvas canvas, Size size) {
            var paint = new Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.black
            ..isAntiAlias = true
            ..strokeWidth = 2
            ..strokeJoin = StrokeJoin.bevel;
            for (var i = 0; i < points.length - 1; i++) {
            if (points[i + 1] != null && points[i] != null) {
                canvas.drawLine(points[i], points[i + 1], paint);
            }
            }
        }

        @override
        bool shouldRepaint(DrawCanvas oldDelegate) {
            return oldDelegate.points != points;
        }
        }
