import 'package:back/Widgets/base_widget.dart';
import 'package:back/Widgets/demo_item.dart';
import 'package:back/category/study/assets/iconData.dart';
import 'package:back/category/study/assets/assetbundle.dart';
import 'package:back/category/study/assets/iconTheme.dart';
import 'package:back/category/study/assets/rawImage.dart';
import 'package:flutter/material.dart';

List<DemoItem> buildAssetsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.assessment,
      title: 'AssetBundle 资源',
      subtitle: '简介',
      keyword: 'assets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('Assets 资源', codePath + 'assets', AssetsBundlePage()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconData 图标数据',
      subtitle: '简介',
      keyword: 'assets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('IconData 图标数据', codePath + 'iconData', IconDataPage()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconTheme 图标主题',
      subtitle: '简介',
      keyword: 'assets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('IconTheme 图标主题', codePath + 'iconTheme', IconThemePage()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'RawImage 原始图像',
      subtitle: '简介',
      keyword: 'assets',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) => BaseWidget('RawImage 原始图像', codePath + 'rawImage', RawImagePage()),
    ),
  ];
}