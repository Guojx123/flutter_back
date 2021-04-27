import 'package:back/category/skill/page_view/custom_indicator.dart';
import 'package:back/category/skill/page_view/indicator.dart';
import 'package:back/category/skill/patterns/builder_create.dart';
import 'package:back/category/skill/patterns/factory_create.dart';
import 'package:back/category/skill/patterns/singleton_create.dart';
import 'package:back/widgets/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:back/Widgets/base_widget.dart';

List<DemoItem> buildCarouselCreateDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.drag_indicator,
      title: '指示器',
      subtitle: '简介',
      keyword: 'indicator_create',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('指示器', codePath + 'indicator', IndicatorPage()),
    ),
    DemoItem(
      icon: Icons.drag_indicator,
      title: '自定义指示器',
      subtitle: '简介',
      keyword: 'indicator_create',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('自定义指示器', codePath + 'custom_indicator', CustomIndicatorPage()),
    ),
  ];
}
