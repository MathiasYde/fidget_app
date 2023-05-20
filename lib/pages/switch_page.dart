import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  SwitchPageState createState() => SwitchPageState();
}

class SwitchPageState extends State<SwitchPage> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 8.0,
        child: Switch(
          value: isToggled,
          onChanged: (bool value) {
            Vibration.vibrate(duration: 125);
            setState(() {
              isToggled = value;
            });
          },
        ),
      ),
    );
  }
}
