import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kCurveHeight = 40;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = Color(0xffad87e4));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}