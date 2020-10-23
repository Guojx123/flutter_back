
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List list = [
    {
      "title":"主标题0",
      "subTitle":"副标题0",
      "avatar":"images/owl.jpg",
    },
    {
      "title":"主标题1",
      "subTitle":"副标题1",
      "avatar":"images/owl.jpg",
    },
    {
      "title":"主标题2",
      "subTitle":"副标题2",
      "avatar":"images/owl.jpg",
    },
    {
      "title":"主标题3",
      "subTitle":"副标题3",
      "avatar":"images/owl.jpg",
    },
    {
      "title":"主标题4",
      "subTitle":"副标题4",
      "avatar":"images/owl.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget("ListView 的基本使用"),
        Expanded(
          child: ListView(
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
            children: list.map((item) {
              return ListTile(
                title: Text(item["title"]),
                subtitle: Text(item["subTitle"]),
                leading: CircleAvatar(
                  backgroundImage: new AssetImage(item["avatar"]),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
