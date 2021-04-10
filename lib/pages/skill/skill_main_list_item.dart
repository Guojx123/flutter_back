import 'package:flutter/material.dart';

class SkillMainPageListItem extends StatefulWidget {

  final String title;
  final List<Widget> itemList;

  SkillMainPageListItem(this.title,this.itemList);

  @override
  _SkillMainPageListItemState createState() => _SkillMainPageListItemState();
}

class _SkillMainPageListItemState extends State<SkillMainPageListItem> {

  String get _title => widget.title;
  List get _itemList => widget.itemList;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: new Text(_title),
      children: _itemList,
    );
  }
}
