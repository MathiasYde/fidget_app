import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fidget_app/custom_painters/radialdial_painter.dart';

class RadialDial extends StatefulWidget {
  const RadialDial({
    super.key,
    this.detents = const [],
    this.onDetent,
    this.onRotate,
  });

  final List<double> detents;
  final Function? onDetent;
  final Function? onRotate;

  @override
  RadialDialState createState() => RadialDialState();
}

class RadialDialState extends State<RadialDial> {
  double angle = 0.0;
  double lastPointerAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    // var position = renderBox.globalToLocal(details.globalPosition);

    return GestureDetector(
      onPanUpdate: (details) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        Offset projectedPointerPosition =
            renderBox.globalToLocal(details.globalPosition);

        Offset pointerPosition = Offset(
          renderBox.size.width / 2 - (projectedPointerPosition.dx),
          renderBox.size.height / 2 - projectedPointerPosition.dy,
        );

        double pointerAngle = atan2(pointerPosition.dy, pointerPosition.dx);

        setState(() {
          angle = pointerAngle;
        });

        for (int i = 0; i < widget.detents.length; i++) {
          double detentAngle = widget.detents[i];
          if ((detentAngle - angle).abs() < 0.1) {
            widget.onDetent?.call(i);
          }
        }

        widget.onRotate?.call(angle);
      },
      child: CustomPaint(
        painter: RadialDialPainter(
          detents: widget.detents,
          angle: angle,
        ),
        child: Container(),
      ),
    );
  }
}
