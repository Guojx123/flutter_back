import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/widgets/appbar.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildOptimizationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.important_devices,
      title: '示例',
      subtitle: '简介',
      keyword: 'optimization',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('optimization 性能优化', codePath + 'optimization', AppBarPage()),
    ),
  ];
}