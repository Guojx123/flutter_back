import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class IconDataPage extends StatefulWidget {
  @override
  _IconDataPageState createState() => _IconDataPageState();
}

class _IconDataPageState extends State<IconDataPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('使用Material Design Icon'),
        SubtitleWidget('直接使用Font中的定义'),
        Text(
          '\uE936' + '\uE001',
          style: TextStyle(
            fontFamily: 'MaterialIcons',
            fontSize: 48,
            color: Colors.cyan,
          ),
        ),
      ],
    );
  }
}
