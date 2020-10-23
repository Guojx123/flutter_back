import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TitleWidget("按钮的类别"),
        SubtitleWidget("RaisedButton 凸起按钮"),
        FractionallySizedBox(
          widthFactor: .6,
          child: RaisedButton(child: Text("RaisedButton"), onPressed: () {}),
        ),
        SubtitleWidget("FlatButton 扁平按钮"),
        FractionallySizedBox(
          widthFactor: .6,
          child: FlatButton(child: Text("FlatButton"), onPressed: () {}),
        ),
        SubtitleWidget("OutlineButton 轮廓按钮"),
        FractionallySizedBox(
          widthFactor: .6,
          child: OutlineButton(child: Text("OutlineButton"), onPressed: () {}),
        ),
        SubtitleWidget("使用[ThemeData.buttonTheme]，可以将按钮主题指定为整体Material主题的一部分"),
        ButtonTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Button"),
            ),
          ),
        ),
        SubtitleWidget("自定义主题、样式"),
        ButtonTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.cyan),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.cyan,
              child: Text("Button"),
            ),
          ),
        ),
        SubtitleWidget('RaisedButton.icon'),
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.keyboard),
          label: Text('Keyboard'),
        ),
        SubtitleWidget('RaisedButton In ButtonBar'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('FlatButton'),
            ),
            RaisedButton(
              onPressed: null,
              child: Text('RaisedButton Disabled'),
            ),
          ],
        ),
        SubtitleWidget('设置RaisedButton的宽度'),
        SubtitleWidget('修改ButtonTheme'),
        Center(
          child: ButtonTheme(
            minWidth: 200,
            height: 100,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ),
        ),
        SubtitleWidget('通过SizedBox设置'),
        Center(
          child: SizedBox(
            width: 100,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ),
        ),
        SubtitleWidget('自定义按钮，以RaisedButton为例'),
        RaisedButton(
          onPressed: () {},
          child: Text('CircleBorder'),
          textColor: Colors.white,
          textTheme: ButtonTextTheme.normal,
          color: Theme.of(context).primaryColor,
          splashColor: Colors.pink,
          highlightColor: Colors.pink,
          elevation: 2.0,
          highlightElevation: 8.0,
          padding: EdgeInsets.all(30.0),
          shape: CircleBorder(
            side: BorderSide(color: Colors.green),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('StadiumBorder'),
          textColor: Colors.white,
          textTheme: ButtonTextTheme.normal,
          color: Theme.of(context).primaryColor,
          splashColor: Colors.pink,
          highlightColor: Colors.pink,
          elevation: 2.0,
          highlightElevation: 8.0,
          padding: EdgeInsets.all(30.0),
          shape: StadiumBorder(
            side: BorderSide(color: Colors.green),
          ),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: Text('改变文本、背景颜色'),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('不可点击'),
          onPressed: null,
        ),
        RaisedButton(
          splashColor: Colors.red,
          child: Text('改变水波纹颜色、添加圆角'),
          shape: StadiumBorder(side: BorderSide(width: 1.0, color: Colors.red)),
          onPressed: () {},
        ),
        RaisedButton(
          highlightColor: Colors.green,
          elevation: 10.0,
          child: Text('改变高亮颜色、阴影强度'),
          onPressed: () {},
        ),
        RaisedButton(
          // 文本内容
          child: Text('Custom RaisedButton'),
          // 按钮颜色
          color: Colors.cyan,
          // 按钮亮度
          colorBrightness: Brightness.dark,
          // 高亮时的背景色
          highlightColor: Colors.yellow,
          // 失效时的背景色
          disabledColor: Colors.grey,
          // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
          textColor: Colors.white,
          // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
          disabledTextColor: Colors.grey,
          // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,RaisedButton，FlatButton，OutlineButton，它们是基于环境ButtonTheme配置的
          //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
          textTheme: ButtonTextTheme.normal,
          // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
          splashColor: Colors.deepPurple,
          // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
          clipBehavior: Clip.antiAlias,
          padding:
          EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
          shape: Border.all(
            // 设置边框样式
            color: Colors.grey,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          onPressed: () {},
          // 改变高亮颜色回掉函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
          onHighlightChanged: (isClick) {},
        ),
        SubtitleWidget("编写代码时，Flutter SDK为1.17，现已更新1.22，按钮部分源码已更改。如下："),
        Image.asset("images/wechat_1.jpg"),
      ],
    );
  }
}
