import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
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
      buildRoute: (context) => BaseWidget('native 与原生交互', codePath + 'native', AppBarPage()),
    ),
  ];
}