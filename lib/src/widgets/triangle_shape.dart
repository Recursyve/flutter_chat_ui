import 'package:flutter/material.dart';

class TriangleShape extends CustomPainter {
  TriangleShape(this.bgColor);

  final Color bgColor;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final linePath = Path();
    linePath.moveTo(-10, 0);
    linePath.lineTo(10, 0);
    canvas.drawPath(linePath, linePaint);

    final trianglePaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final trianglePath = Path();
    trianglePath.moveTo(-10, 0);
    trianglePath.lineTo(0, 10);
    trianglePath.lineTo(10, 0);
    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}