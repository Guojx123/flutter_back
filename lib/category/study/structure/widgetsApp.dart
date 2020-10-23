import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class WidgetsAppPage extends StatefulWidget {
  @override
  _WidgetsAppPageState createState() => _WidgetsAppPageState();
}

class _WidgetsAppPageState extends State<WidgetsAppPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleWidget('WidgetsApp 简单介绍'),
        SubtitleWidget('WidgetsApp是Root Widget的一种，用于自定义一些属性时使用，'
            '我们也可以自己制作一些Widget。'),
        SubtitleWidget('类别'),
        SubtitleWidget('MaterialApp是实现了Material Design的Root Widget'),
        SubtitleWidget('CupertinoApp是实现了iOS设计风格的Root Widget'),
      ],
    );
  }
}
