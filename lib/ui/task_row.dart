import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/task.dart';

class TextRow extends StatefulWidget {
  final Task task;
  final double dotSize = 12.0;
  final Animation<double> animation;
  const TextRow({Key key, @required this.task, this.animation})
      : super(key: key);
  _TextRowState createState() => _TextRowState();
}

class _TextRowState extends State<TextRow> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: new SizeTransition(
        sizeFactor: widget.animation,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
            children: <Widget>[
              new Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 32.0 - widget.dotSize / 2),
                child: new Container(
                  height: widget.dotSize,
                  width: widget.dotSize,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle, color: widget.task.color),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.task.name,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      widget.task.category,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: new Text(
                  widget.task.time,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
