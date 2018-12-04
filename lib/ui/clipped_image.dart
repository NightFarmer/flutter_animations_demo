import 'package:flutter/material.dart';

class ChippedImage extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      var path = new Path()..lineTo(0.0, size.height-60.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)..close();
      return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}