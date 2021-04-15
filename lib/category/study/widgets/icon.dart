import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class IconPage extends StatefulWidget {
  @override
  _IconPageState createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {

  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        TitleWidget("系统自带默认Icons数据"),
        SubtitleWidget("add 添加"),
        Icon(
          Icons.add,
          size: 20,
          color: Colors.black,
        ),
        SubtitleWidget("semanticLabel 语义标签"),
        Icon(
          Icons.access_time,
          semanticLabel: "语义标签",
        ),
        SubtitleWidget("textDirection"),
        Icon(
          Icons.print,
          textDirection: TextDirection.ltr,
        ),
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
        TitleWidget('显示Asset数据'),
        SubtitleWidget('使用ImageIcon修改Icon颜色、Size'),
        ImageIcon(
          AssetImage('images/logo.png'),
          color: Colors.black,
          size: 50.0,
        ),
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
