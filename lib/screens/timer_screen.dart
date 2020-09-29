import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  bool isStart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '스톱 워치',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: const EdgeInsets.only(top: 18),
            // color: Colors.red,
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime = StopWatchTimer.getDisplayTime(value);
                return Text(
                  displayTime,
                  style: TextStyle(fontSize: 75),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                child: IconButton(
                  icon: Icon(
                    Icons.replay,
                    size: 60,
                  ),
                  onPressed: () =>
                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                child: IconButton(
                  icon: !isStart
                      ? Icon(
                          Icons.play_arrow,
                          size: 60,
                        )
                      : Icon(
                          Icons.pause,
                          size: 60,
                        ),
                  onPressed: () {
                    if (isStart) {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      setState(() {
                        isStart = false;
                      });
                    } else {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                      setState(() {
                        isStart = true;
                      });
                    }
                  },
                ),
              ),
              FlatButton(
                onPressed: () =>
                    _stopWatchTimer.onExecute.add(StopWatchExecute.lap),
                child: Text(
                  'Lap',
                  style: TextStyle(fontSize: 40),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            child: Container(
              height: 300,
              margin: EdgeInsets.all(8),
              child: StreamBuilder<List<StopWatchRecord>>(
                stream: _stopWatchTimer.records,
                initialData: _stopWatchTimer.records.value,
                builder: (context, snap) {
                  final value = snap.data;
                  if (value.isEmpty) {
                    return Container();
                  }
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  });
                  print('Listen records. $value');
                  return ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final data = value[index];
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            color: Colors.lightBlueAccent,
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${data.displayTime}'),
                                Text('Lap ${index + 1}'),
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      );
                    },
                    itemCount: value.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.label_important),
      //   onPressed: () => _stopWatchTimer.onExecute.add(StopWatchExecute.lap),
      // ),
    );
  }
}
