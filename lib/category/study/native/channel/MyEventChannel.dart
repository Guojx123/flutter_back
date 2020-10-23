import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyEventChannel extends StatefulWidget {
  @override
  _MyEventChannelState createState() => _MyEventChannelState();
}

class _MyEventChannelState extends State<MyEventChannel> {
  static const EventChannel _eventChannel = const EventChannel('flutter_demo_jiaohu.flutter.io/event_channel');
  StreamSubscription _streamSubscription;
  Object obj;
  
  @override
  void initState() {
    super.initState();
    // 监听开始
    _streamSubscription = _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  @override
  void dispose() {
    if(_streamSubscription != null){
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('原生交互 - BasicMessageChannel'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$obj'),
            RaisedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("relapse"),
            )
          ],
        ),
      ),
    );
  }

  void _onEvent(Object event) {
    print('Flutter - 返回的内容: $event');
    setState(() {
      obj = event;
    });
  }

  void _onError(Object error) {
    print('Flutter - 返回的错误');
    setState(() {
      obj = error;
    });
  }

  // void deactivate(){
  //   print('deactivate');
  // }

  // void dispose(){
  //   print('dispose');
  // }

}