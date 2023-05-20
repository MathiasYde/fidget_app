import 'package:flutter/material.dart';

import 'package:vibration/vibration.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  ButtonPageState createState() => ButtonPageState();
}

class ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 4.0,
        child: ElevatedButton(
          child: const Icon(Icons.vibration),
          onPressed: () {
            Vibration.vibrate(duration: 125);
          },
        ),
      ),
    );
  }
}
