import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMethodChannel extends StatefulWidget {
  @override
  _MyMethodChannelState createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {
  static const MethodChannel _methodChannel = const MethodChannel('com.flutter.guide.MethodChannel');
  int _nativeData = 0;

  @override
  void initState() {
    super.initState();
    _methodChannel.setMethodCallHandler((call) {
      setState(() {
        _nativeData = call.arguments['count'];
      });
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('原生交互 - MyMethodChannel'),),
      body: Center(
        child: Text("原生返回数据：${_nativeData.toString()}\n（每一秒自增1）"),
      ),
    );
  }

}