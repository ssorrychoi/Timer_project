import 'package:flutter/material.dart';
import 'package:project_timer/screens/add_timer.dart';
import 'package:project_timer/screens/custom_timer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomTimer())),
              child: Text('혜진아....'))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTimer()));
        },
      ),
    );
  }
}
