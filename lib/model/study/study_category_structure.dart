
import 'package:back/category/study/structure/appbar.dart';
import 'package:back/category/study/structure/bottomNavigationBar.dart';
import 'package:back/category/study/structure/defaultTabController.dart';
import 'package:back/category/study/structure/drawer.dart';
import 'package:back/category/study/structure/navigationRail.dart';
import 'package:back/category/study/structure/safeArea.dart';
import 'package:back/category/study/structure/sliverappbar.dart';
import 'package:back/category/study/structure/tabBar.dart';
import 'package:back/category/study/structure/tabBarView.dart';
import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/structure/widgetsApp.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildStructureDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.account_balance,
      title: 'AppBar 应用栏',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('AppBar 应用栏', codePath + 'appbar', AppBarPage()),
    ),
    DemoItem(
      icon: Icons.account_balance,
      title: 'BottomNavigationBar 底部导航栏',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('BottomNavigationBar 底部导航栏的应用', codePath + 'bottomNavigationBar', BottomNavigationBarPage()),
    ),
    DemoItem(
      icon: Icons.account_balance,
      title: 'SliverAppBar 滑动应用栏',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('SliverAppBar 滑动应用栏', codePath + 'sliverAppBar', SliverAppBarPage()),
    ),
    DemoItem(
      icon: Icons.account_balance,
      title: 'TabBar 选项卡控件',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('TabBar 选项卡控件', codePath + 'tabBar', TabBarPage()),
    ),
    DemoItem(
      icon: Icons.account_balance,
      title: 'TabBarView 选项卡视图',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('TabBarView 选项卡视图', codePath + 'tabBarView', TabBarViewPage()),
    ),
    DemoItem(
      icon: Icons.account_balance,
      title: 'DefaultTabController 默认选项卡控制器',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('DefaultTabController 默认选项卡控制器', codePath + 'defaultTabController', DefaultTabControllerPage()),
    ),
    DemoItem(
      icon:Icons.account_balance,
      title: 'Drawer 抽屉',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget("Drawer", codePath + 'drawer', DrawerPage()),
    ),
    DemoItem(
      icon:Icons.account_balance,
      title: 'NavigationRail 侧边导航栏',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget("NavigationRail 侧边导航栏", codePath + 'navigationRail', NavigationRailPage()),
    ),
    DemoItem(
      icon:Icons.account_balance,
      title: 'WidgetsApp 自定义组件',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget("WidgetsApp 自定义组件", codePath + 'widgetsApp', WidgetsAppPage()),
    ),
    DemoItem(
      icon:Icons.account_balance,
      title: 'SafeArea 安全区域（适配全面屏、异形屏）',
      subtitle: '简介',
      keyword: 'structure',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => SafeAreaPage(),
    ),
  ];
}