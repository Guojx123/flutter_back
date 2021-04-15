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
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.teal,
      ),
      child: ExpansionTile(
        title: new Text(_title,style: TextStyle(
          fontSize: 20,
        ),),
        initiallyExpanded: true,
        children: _itemList
            .map((e) => listItem(e.title, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: e.buildRoute),
                  );
                }))
            .toList(),
      ),
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
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
