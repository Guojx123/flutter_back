import 'package:back/category/skill/notes/placeholder.dart';
import 'package:back/category/skill/page_view/custom_indicator.dart';
import 'package:back/category/skill/page_view/indicator.dart';
import 'package:back/widgets/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:back/Widgets/base_widget.dart';

List<DemoItem> buildNotesCreateDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.note_add,
      title: 'Placeholder（占位文字和图片）',
      subtitle: '简介',
      keyword: 'placeholder',
      documentationUrl: 'https://flutter.cn/',
      buildRoute: (context) =>
          BaseWidget('占位文字和图片', codePath + 'placeholder', NotesPlaceholder()),
    ),
  ];
}
