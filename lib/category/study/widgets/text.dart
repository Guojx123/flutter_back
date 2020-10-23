import 'package:back/Widgets/subtitle_widget.dart';
import 'package:back/Widgets/title_widget.dart';
import 'package:back/widgets/multi_selection_widget.dart';
import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {

  var decorationStyle = TextDecorationStyle.solid;
  var decorationType = TextDecoration.underline;
  var softWrapSelection = true;
  var overflowSelection = TextOverflow.ellipsis;
  var textAlign = TextAlign.left;
  var justifyEnable = false;
  var textScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TitleWidget('Text基本使用'),
        Text('Simple text'),
        SubtitleWidget('文本方向'),
        Text(
          '文本方向 rtl',
          textDirection: TextDirection.rtl,
        ),
        TitleWidget('TextAlign'),
        SubtitleWidget('控制水平方向的对齐方式'),
        MultiSelectionWidget('TextAlign', TextAlign.values, TextAlign.values,
            (value) {
          setState(() => textAlign = value);
        }),
        Text(
          '示例文本',
          textAlign: textAlign,
        ),
        SizedBox(height: 16),
        TitleWidget('Justify 铺满'),
        Row(
          children: <Widget>[
            Text('切换'),
            Switch(
              value: justifyEnable,
              onChanged: (value) {
                setState(() => justifyEnable = value);
              },
            ),
          ],
        ),
        Text(
          'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
          textAlign: justifyEnable ? TextAlign.justify : TextAlign.left,
        ),
        SizedBox(height: 16),
        TitleWidget('Text Decoration 装饰'),
        Text(
          'Some Text In Flutter 示例文本',
          style: TextStyle(
            fontSize: 20,
            decoration: decorationType,
            decorationStyle: decorationStyle,
          ),
        ),
        MultiSelectionWidget(
          'DecorationStyle 风格',
          TextDecorationStyle.values,
          TextDecorationStyle.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => decorationStyle = value);
          },
        ),
        MultiSelectionWidget(
          'DecorationType 类型',
          [
            TextDecoration.underline,
            TextDecoration.none,
            TextDecoration.lineThrough,
            TextDecoration.overline,
          ],
          [
            'underline',
            'none',
            'lineThrough',
            'overline',
          ],
          (value) {
            setState(() => decorationType = value);
          },
        ),
        SubtitleWidget('Shadow in Text'),
        Text(
          '文字阴影',
          style: TextStyle(
            shadows: [
              Shadow(
                color: Colors.teal,
                offset: Offset(1, 1),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        SubtitleWidget('粗体、斜体:'),
        RichText(
            text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "粗体",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  TextSpan(text: "   "),
                  TextSpan(
                      text: "斜体abc",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      )
                  ),
                ]
            )
        ),
        TitleWidget('Text SoftWrap'),
        Text(
          '换行测试abc' * 10,
          softWrap: softWrapSelection,
        ),
        MultiSelectionWidget(
          'SoftWrap',
          [true, false],
          [true, false],
          (value) {
            setState(() => softWrapSelection = value);
          },
        ),
        TitleWidget('Text Overflow'),
        Text(
          '换行溢出样式' * 20,
          maxLines: 2,
          overflow: overflowSelection,
        ),
        MultiSelectionWidget(
          'Overflow',
          TextOverflow.values,
          TextOverflow.values,
          (value) {
            setState(() => overflowSelection = value);
          },
        ),
        TitleWidget('TextStyle'),
        Text(
          '文本Style.' * 3,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            backgroundColor: Colors.cyan,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
          ),
        ),
        TitleWidget('StrutStyle'),
        SubtitleWidget('height 设置行高为 2 leading 设置行间距为 2'),
        Container(
          color: Colors.lightBlueAccent,
          child: Text(
            'StrutStyle ' * 20,
            strutStyle: StrutStyle(
              height: 2,
              leading: 2,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TitleWidget('textScaleFactor'),
        SubtitleWidget("文本缩放比率：${textScaleFactor.toString().substring(0,3)}"),
        Text(
          'textScaleFactor',
          textScaleFactor: textScaleFactor,
        ),
        Row(
          children: <Widget>[
            Text('ScaleFactor'),
            Slider(
                max: 3,
                min: 0.5,
                value: textScaleFactor,
                onChanged: (v) {
                  setState(() => textScaleFactor = v);
                }),
          ],
        ),
        TitleWidget('SelectableText'),
        SelectableText(
          '我是一段可以被选择的Text长文本。' * 3,
          showCursor: true,
          cursorWidth: 5,
          cursorColor: Colors.red,
          cursorRadius: Radius.circular(8),
        ),
        SizedBox(height: 50)
      ],
    );
  }
}
