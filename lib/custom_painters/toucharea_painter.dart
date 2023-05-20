import 'package:flutter/material.dart';

class TouchAreaPainter extends CustomPainter {
  Color backgroudColor;
  Color fillColor;
  double spacing = 4.0;
  double radius = 0.4;

  TouchAreaPainter({
    this.backgroudColor = Colors.black12,
    this.fillColor = Colors.black26,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // fill background with backgroundColor
    Paint paint = Paint()
      ..color = backgroudColor
      ..style = PaintingStyle.fill;

    Offset offset = Offset(size.width * 0.5, size.height * 0.5);
    Rect rect = Rect.fromCenter(
      center: offset,
      width: size.width,
      height: size.height,
    );
    canvas.drawRect(rect, paint);

    // draw each dot
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        paint.color = fillColor;
        offset = Offset(x + (spacing * 0.5), y + (spacing * 0.5));
        canvas.drawCircle(offset, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
