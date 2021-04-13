import 'package:back/widgets/demo_item.dart';
import 'package:flutter/material.dart';

class SkillMainPageListItem extends StatefulWidget {
  final String title;
  final List<DemoItem> itemList;

  SkillMainPageListItem(this.title, this.itemList);

  @override
  _SkillMainPageListItemState createState() => _SkillMainPageListItemState();
}

class _SkillMainPageListItemState extends State<SkillMainPageListItem> {
  String get _title => widget.title;

  List<DemoItem> get _itemList => widget.itemList;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: new Text(_title),
      children: _itemList
          .map((e) => listItem(e.title, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: e.buildRoute),
                );
              }))
          .toList(),
    );
  }

  Widget listItem(String title, Function onTap) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 48),
              decoration: BoxDecoration(
                color: Color(0xFF2E8B57),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
