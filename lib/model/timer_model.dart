import 'package:flutter/cupertino.dart';

class MyTimer extends ChangeNotifier {
  String title;
  int time;

  MyTimer({this.title, this.time});

  MyTimer.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['time'] = this.time;
    return data;
  }
}
