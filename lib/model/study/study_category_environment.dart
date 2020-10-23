import 'package:back/Category/Study/config/config.dart';
import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildEnvironmentDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.important_devices,
      title: '应用整体框架',
      subtitle: '简介',
      keyword: 'app',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('应用整体框架', codePath + 'app', ConfigPage(),isMarkDown:true),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: '配置Windows开发环境',
      subtitle: '简介',
      keyword: 'Windows',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('配置Windows开发环境', codePath + 'windows', ConfigPage(),isMarkDown:true),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: '配置MacOS开发环境',
      subtitle: '简介',
      keyword: 'MacOS',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('配置Windows开发环境', codePath + 'configPage', ConfigPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: '开发工具的选择与使用',
      subtitle: '简介',
      keyword: 'IDEA',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('配置Windows开发环境', codePath + 'configPage', ConfigPage()),
    ),
  ];
}