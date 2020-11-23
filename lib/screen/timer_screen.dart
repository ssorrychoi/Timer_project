import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // borderRadius: BorderRadius.circular(50),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(50),
                  topRight: const Radius.circular(50))),
          child: Center(
              child: Column(
            children: [
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'Timer Screen',
                style: TextStyle(fontSize: 60),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
