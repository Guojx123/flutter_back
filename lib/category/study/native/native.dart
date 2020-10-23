import 'package:back/category/study/native/channel/MyBasicMessageChannel.dart';
import 'package:back/category/study/native/channel/MyEventChannel.dart';
import 'package:back/category/study/native/channel/MyMethodChannel.dart';
import 'package:flutter/material.dart';

class NativePage extends StatefulWidget {
  @override
  _NativePageState createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          ///a.用于传递字符串和半结构化的信息
          RaisedButton(
            child: Text('BasicMessageChannel'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBasicMessageChannel()));
            },
          ),
          SizedBox(height: 25,),
          ///b.用于传递方法调用（method invocation）
          RaisedButton(
            child: Text('MethodChannel'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyMethodChannel()));
            },
          ),
          SizedBox(height: 25,),
          ///c.用于数据流（event streams）的通信
          RaisedButton(
            child: Text('EventChannel'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyEventChannel()));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyEventChannel())).then((value){
              //   print('_result' + value);
              // });
            },
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
