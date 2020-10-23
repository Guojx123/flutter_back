import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/route/hero.dart';
import 'package:back/category/study/route/navigator.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildRouteDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Hero 动画',
      subtitle: '简介',
      keyword: 'route',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Hero 动画', codePath + 'hero', HeroPage()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'NavigatorPage 导航与路由',
      subtitle: '简介',
      keyword: 'route',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('NavigatorPage 导航与路由', codePath + 'navigator', NavigatorPage()),
    ),
  ];
}