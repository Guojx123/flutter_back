import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/native/native.dart';
import 'package:back/category/study/widgets/appbar.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildNativeDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 与原生交互',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 与原生交互', codePath + 'native', NativePage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 与原生交互（文档）',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 与原生交互', codePath + 'native', AppBarPage(),isMarkDown: true,),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 嵌入原生View-Android',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 嵌入原生View-Android', codePath + 'android', AppBarPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 嵌入原生View-Android（文档）',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 嵌入原生View-Android', codePath + 'android', AppBarPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 嵌入原生View-iOS',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 嵌入原生View-iOS', codePath + 'ios', AppBarPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Native 嵌入原生View-iOS（文档）',
      subtitle: '简介',
      keyword: 'native',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Native 嵌入原生View-iOS', codePath + 'ios', AppBarPage()),
    ),
  ];
}