import 'package:flutter/material.dart';

class SingletonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('测试测试'),
    );
  }
}



class Singleton {
  /// 单例对象
  static Singleton _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Singleton._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Singleton.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = Singleton._internal();
    }
    return _instance;
  }
}
