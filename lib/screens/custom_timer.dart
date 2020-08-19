import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CustomTimer extends StatefulWidget {
  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  bool end = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Title'),
              CircularCountDownTimer(
                duration: 10,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                fillColor: Colors.greenAccent,
                strokeWidth: 5.0,
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
                isReverse: false,
                onComplete: () {
                  setState(() {
                    end = !end;
                  });
                },
              ),
              end ? Text('End!') : Container(),
              RaisedButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    end = !end;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
