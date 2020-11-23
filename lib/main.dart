import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timer_pt/screen/stopwatch_screen.dart';
import 'package:timer_pt/screen/tabata_screen.dart';
import 'package:timer_pt/screen/timer_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // bottomSheetTheme: BottomSheetThemeData(
        //     backgroundColor: Colors.yellow,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.vertical(top: Radius.circular(10)))),
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            // _index == 2
            //     ? IconButton(
            //         icon: Icon(Icons.lock_outline),
            //         color: Colors.white,
            //         onPressed: () {},
            //       )
            //     : Container(),
            IconButton(
              icon: Icon(Icons.folder_open),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(60),
          //   child: Text(
          //     'hello',
          //     style: TextStyle(fontSize: 30),
          //   ),
          // ),
        ),
        // body: _index == 0
        //     ? TimerScreen()
        //     : _index == 1 ? StopWatchScreen() : TabataScreen(),
        bottomNavigationBar: FloatingNavbar(
          borderRadius: 50,
          itemBorderRadius: 50,
          iconSize: 0,
          fontSize: 15,
          selectedItemColor: Colors.white,
          selectedBackgroundColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueAccent,
          backgroundColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(title: '타이머'),
            FloatingNavbarItem(title: '스톱워치'),
            FloatingNavbarItem(title: '타바타')
          ],
        ),
        body: SlidingUpPanel(
          minHeight: 60,

          // maxHeight: MediaQuery.of(context).size.height - 100,
          panel: _index == 0
              ? TimerScreen()
              : _index == 1 ? StopWatchScreen() : TabataScreen(),
          collapsed: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24))),
            child: Center(
                child: _index == 0
                    ? Text('Timer', style: TextStyle(color: Colors.white))
                    : _index == 1
                        ? Text(
                            'StopWatch',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            'Tabata',
                            style: TextStyle(color: Colors.white),
                          )),
          ),
          body: Center(
            child: Text('This is body'),
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        ),
      ),
    );
  }
}
