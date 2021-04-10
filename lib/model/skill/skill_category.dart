import 'package:flutter/material.dart';

List<SkillItemCategory> buildSkillCategoryList = [
  designPatterns,
];

SkillItemCategory designPatterns = SkillItemCategory(
  name: '设计模式',
  itemList: [
    ListTile(
      title: Text('测试1'),
    ),
    ListTile(
      title: Text('测试2'),
    ),
    ListTile(
      title: Text('测试3'),
    ),
  ],
);



class SkillItemCategory {
  final String name;
  final List<Widget> itemList;

  SkillItemCategory({this.name, this.itemList});
}