import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/layout/flow.dart';
import 'package:back/category/study/layout/gridView.dart';
import 'package:back/category/study/layout/listView.dart';
import 'package:back/category/study/layout/positioned.dart';
import 'package:back/category/study/layout/stack.dart';
import 'package:back/category/study/layout/table.dart';
import 'package:back/category/study/layout/warp.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildLayoutDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.important_devices,
      title: 'ListView 列表布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('ListView 列表布局', codePath + 'listView', ListViewPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'GridView 网格布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('GridView 网格布局', codePath + 'gridView', GridViewPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Positioned 定位布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Positioned 定位布局', codePath + 'positioned', PositionedPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Stack 层叠布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Stack 层叠布局', codePath + 'stack', StackPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Flow 流式布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Flow 流式布局', codePath + 'flow', FlowPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Warp 自适应布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Warp 自适应布局', codePath + 'warp', WarpPage()),
    ),
    DemoItem(
      icon: Icons.important_devices,
      title: 'Table 表格布局',
      subtitle: '简介',
      keyword: 'layout',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Table 表格布局', codePath + 'table', TablePage()),
    ),
    // 7.Table 表格布局
  ];
}