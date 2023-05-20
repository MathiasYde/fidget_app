import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fidget_app/components/radial_dial.dart';

import 'package:vibration/vibration.dart';

class RadialDialPage extends StatefulWidget {
  const RadialDialPage({super.key});

  @override
  RadialDialPageState createState() => RadialDialPageState();
}

class RadialDialPageState extends State<RadialDialPage> {
  final List<double> detents = List<double>.generate(8, (i) => pi / 4 * i);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.8,
        child: RadialDial(
          onDetent: (int i) {
            Vibration.vibrate(duration: 80);
          },
          onRotate: (double angle) {
            Vibration.vibrate(duration: 4);
          },
          detents: detents,
        ),
      ),
    );
  }
}
