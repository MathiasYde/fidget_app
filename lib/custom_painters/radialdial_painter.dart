import 'dart:math';

import 'package:flutter/material.dart';

class RadialDialPainter extends CustomPainter {
  Color backgroudColor;
  Color fillColor;
  List<double> detents;
  double radialOffset = 16.0;
  double detentLength = 0.5;
  double angle = 0.0;

  RadialDialPainter({
    required this.angle,
    this.detents = const [],
    this.backgroudColor = Colors.black12,
    this.fillColor = Colors.black26,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) * 0.5;
    Offset center = Offset(size.width * 0.5, size.height * 0.5);

    Paint paint = Paint()..color = backgroudColor;

    canvas.drawCircle(
      center,
      radius,
      paint,
    );

    // draw each detent
    for (double detentAngle in detents) {
      double x = cos(detentAngle + angle);
      double y = sin(detentAngle + angle);

      Offset end = Offset(
        x * (radius - radialOffset) + center.dx,
        y * (radius - radialOffset) + center.dy,
      );

      Offset start = Offset(
        center.dx * (1.0 - detentLength) + end.dx * detentLength,
        center.dy * (1.0 - detentLength) + end.dy * detentLength,
      );

      paint.strokeWidth = 8.0;
      paint.strokeCap = StrokeCap.round;
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
