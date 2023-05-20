import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';

import 'package:fidget_app/custom_painters/toucharea_painter.dart';

class TouchAreaPage extends StatefulWidget {
  const TouchAreaPage({super.key});

  @override
  TouchAreaPageState createState() => TouchAreaPageState();
}

class TouchAreaPageState extends State<TouchAreaPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 4.0,
        child: GestureDetector(
          onPanUpdate: (details) {
            double velocity = details.delta.distance * 100;
            velocity = pow(velocity, 0.8) as double;
            velocity = clampDouble(velocity, 1, 255);
            Vibration.vibrate(duration: 40, amplitude: velocity.toInt());
          },
          child: CustomPaint(
            painter: TouchAreaPainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
