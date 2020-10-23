import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/widgets/appbar.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildNetworksDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.important_devices,
      title: '示例',
      subtitle: '简介',
      keyword: 'network',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Network 网络', codePath + 'network', AppBarPage()),
    ),
  ];
}