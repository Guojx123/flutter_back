import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class PlaceholderPage extends StatefulWidget {
  @override
  _PlaceholderPageState createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('Placeholder基本使用'),
        Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Placeholder(
            color: Colors.blue,
          ),
        ),
        TitleWidget('Placeholder修改线条和颜色'),
        Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Placeholder(
            color: Colors.green,
            strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
