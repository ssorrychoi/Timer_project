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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(title: Text('Blah')),
            ListTile(title: Text('Blah'))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('내 타이머'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              alignment: Alignment.centerLeft,
              child: Text(
                '최근활동',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                  // Container(
                  //   height: 100,
                  //   child: ListView.separated(
                  //       itemBuilder: (context, index) => Card(
                  //             child: Column(
                  //               children: [
                  //                 Icon(Icons.create),
                  //                 Text('러닝 ${index}분'),
                  //                 Text('타이머 00:20:00')
                  //               ],
                  //             ),
                  //           ),
                  //       separatorBuilder: (context, index) => Divider(
                  //             color: Colors.black12,
                  //           ),
                  //       itemCount: 5),
                  // )

                  Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Icon(Icons.create),
                        Text('러닝 20분'),
                        Text('타이머 00:20:00')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
              alignment: Alignment.centerLeft,
              child: Text(
                '최근활동',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              children: [
                Card(
                  child: Column(
                    children: [
                      Icon(Icons.create),
                      Text('러닝 20분'),
                      Text('타이머 00:20:00')
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Icon(Icons.create),
                      Text('러닝 20분'),
                      Text('타이머 00:20:00')
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Icon(Icons.create),
                      Text('러닝 20분'),
                      Text('타이머 00:20:00')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),

//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => AddTimer()));
//        },
//      ),
    );
  }
}
