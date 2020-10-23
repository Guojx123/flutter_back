import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:back/category/study/widgets/easeImport.dart';

List<DemoItem> buildWidgetDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.widgets,
      title: 'Text 文本',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Text 文本控件的使用', codePath + 'text', TextPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Icon 图标',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Icon 图标控件的使用', codePath + 'icon', IconPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Container 容器',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Container 容器的使用', codePath + 'container', ContainerPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Image 图片',
      subtitle: 'Image组件用于显示图片，图片的来源可以是网络、项目中图片或者设备上的图片',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('图片控件的使用', codePath + 'image', ImagePage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Button 按钮',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('图片控件的使用', codePath + 'button', ButtonPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Row 行',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('横向控件的使用', codePath + 'row', RowPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Column 列',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('纵向控件的使用', codePath + 'column', ColumnPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Placeholder 占位符',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('占位符的使用', codePath + 'placeholder', PlaceholderPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Appbar 应用栏',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('应用栏的使用', codePath + 'appbar', AppBarPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'Scaffold 应用脚手架',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('脚手架的使用', codePath + 'scaffold', ScaffoldPage()),
    ),
    DemoItem(
      icon: Icons.widgets,
      title: 'MaterialApp 材质应用',
      subtitle: '暂无简介',
      keyword: 'widgets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('材质应用', codePath + 'materialApp', MaterialAppPage()),
    ),
  ];
}