import 'package:back/widgets/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:back/Widgets/base_widget.dart';
import 'package:back/Category/Study/config/config.dart';

List<DemoItem> buildDesignPatternsCreateDemoItems(String codePath){
  return [
    DemoItem(
      icon: Icons.design_services,
      title: '单例模式-创建型',
      subtitle: '简介',
      keyword: 'singleton_create',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('单例模式', codePath + 'singleton_create', ConfigPage(),isMarkDown:true),
    ),
    DemoItem(
      icon: Icons.design_services,
      title: '工厂模式',
      subtitle: '简介',
      keyword: 'designPatterns',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('工厂模式', codePath + 'app', ConfigPage(),isMarkDown:true),
    ),
  ];
}