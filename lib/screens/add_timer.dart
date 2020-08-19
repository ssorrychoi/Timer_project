import 'package:flutter/material.dart';

class AddTimer extends StatefulWidget {
  @override
  _AddTimerState createState() => _AddTimerState();
}

class _AddTimerState extends State<AddTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('하나도 정하고'),
            Text('둘도 정하고'),
            Text('셋도 정하고'),
          ],
        ),
      )),
    );
  }
}
