import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class IconThemePage extends StatefulWidget {
  @override
  _IconThemePageState createState() => _IconThemePageState();
}

class _IconThemePageState extends State<IconThemePage> {

  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('IconTheme基本使用'),
        SubtitleWidget('给Icon设置Theme 白色50%透明度'),
        AppBar(
          actions: <Widget>[
            IconTheme(
              data: IconThemeData(
                color: Colors.white,
                opacity: 0.5,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.account_balance),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.access_alarm),
                  ),
                ],
              ),
            ),
          ],
        ),
        SubtitleWidget('给Icon设置Theme 白色'),
        AppBar(
          actions: <Widget>[
            IconTheme(
              data: IconThemeData(color: isLike ? Colors.red : Colors.white),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      setState(() => isLike = !isLike);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('喜欢'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

