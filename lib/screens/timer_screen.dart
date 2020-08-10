import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = StopWatchTimer.getDisplayTime(value);
              return Column(
                children: [
                  Text(displayTime),
                  Divider(),
                  Text(value.toString()),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.minuteTime,
              initialData: _stopWatchTimer.minuteTime.value,
              builder: (context, snap) {
                final value = snap.data;
                print('Listen every minute. $value');
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('minute'),
                        Text(value.toString()),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.secondTime,
              initialData: _stopWatchTimer.secondTime.value,
              builder: (context, snap) {
                final value = snap.data;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Second'),
                        Text(value.toString()),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            height: 120,
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
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '${index + 1} ${data.displayTime}',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    );
                  },
                  itemCount: value.length,
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                },
                child: Text('Start'),
              ),
              RaisedButton(
                onPressed: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                },
                child: Text('Stop'),
              ),
              RaisedButton(
                onPressed: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                },
                child: Text('Reset'),
              ),
              RaisedButton(
                onPressed: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                },
                child: Text('Lap Time'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
