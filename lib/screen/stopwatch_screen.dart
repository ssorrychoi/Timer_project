import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchScreen extends StatefulWidget {
  @override
  _StopWatchScreenState createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<int>(
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
        // SizedBox(
        //   height: 50,
        // ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 80,
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
              width: 80,
              height: 80,
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
        // SizedBox(
        //   height: 30,
        // ),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
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
                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final data = value[index];
                    return Column(
                      children: [
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
                        Divider(height: 8, color: Colors.white),
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
    );
  }
}
