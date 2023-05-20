import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.error, {super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
        child: Text(error),
      ),
    );
  }
}
