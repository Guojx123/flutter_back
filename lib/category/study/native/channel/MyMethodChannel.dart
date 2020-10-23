import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMethodChannel extends StatefulWidget {
  @override
  _MyMethodChannelState createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {
  static const MethodChannel _methodChannel = const MethodChannel('flutter_demo_jiaohu.flutter.io/method_channel');
  String _batteryLevel = 'Unknown battery level.';

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('原生交互 - BasicMessageChannel'),),
      body: Center(
        child: Text(_batteryLevel),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      //调用原生方法，接收返回的数据
      final int result = await _methodChannel.invokeMethod('getBatteryLevel',"Flutter Message");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}