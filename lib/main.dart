import 'package:flutter/material.dart';
import 'package:project_timer/screens/add_timer.dart';
import 'package:project_timer/screens/home_screen.dart';
import 'package:project_timer/screens/setting_screen.dart';
import 'package:project_timer/screens/timer_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _screens = [
    HomeScreen(),
    TimerScreen(),
    SettingScreen(),
    AddTimer(),
  ];

  int _currentScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedFontSize: 10.0,
        currentIndex: _currentScreen,
        onTap: changeScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer), title: Text('Stop Watch')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Setting')),
          BottomNavigationBarItem(icon: Icon(Icons.done), title: Text('Timer'))
        ],
      ),
    );
  }

  void changeScreen(int value) {
    setState(() {
      _currentScreen = value;
    });
  }
}
