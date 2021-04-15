import 'package:back/category/skill/patterns/builder_create.dart';
import 'package:back/category/skill/patterns/factory_create.dart';
import 'package:back/category/skill/patterns/singleton_create.dart';
import 'package:back/widgets/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:back/Widgets/base_widget.dart';

List<DemoItem> buildDesignPatternsCreateDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.design_services,
      title: '单例模式-创建型',
      subtitle: '简介',
      keyword: 'singleton_create',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('单例模式', codePath + 'singleton_create', SingletonPage()),
    ),
    DemoItem(
      icon: Icons.design_services,
      title: '工厂模式-创建型',
      subtitle: '简介',
      keyword: 'factory',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('工厂模式', codePath + 'factory_create', FactoryPage()),
    ),
    DemoItem(
      icon: Icons.design_services,
      title: '建造者模式-创建型',
      subtitle: '简介',
      keyword: 'builder',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('建造者模式', codePath + 'builder_create', BuilderPage()),
    ),
  ];
}
