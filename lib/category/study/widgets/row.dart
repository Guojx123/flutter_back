import 'file:///E:/flutter_back/lib/widgets/common_row.dart';
import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'file:///E:/flutter_back/lib/widgets/commonInput_row.dart';

class RowPage extends StatefulWidget {
  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {

  var sizeSelection = MainAxisSize.min;
  var mainAlignSelection = MainAxisAlignment.start;
  var crossAlignSelection = CrossAxisAlignment.start;
  var textDirectionSelection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TitleWidget('设置主轴尺寸'),
        SubtitleWidget("尺寸 $sizeSelection"),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.cyan,
            child: Row(
              mainAxisSize: sizeSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('RowItem3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'MainAxisSize',
          MainAxisSize.values,
          MainAxisSize.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() => sizeSelection = value);
          },
        ),
        TitleWidget('设置主轴对齐方式'),
        SubtitleWidget("主轴对齐方式 ：$mainAlignSelection"),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.cyan,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: mainAlignSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'MainAxisAlignment',
          MainAxisAlignment.values,
          MainAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() {
              mainAlignSelection = value;
            });
          },
        ),
        TitleWidget('设置副轴对齐方式' ),
        SubtitleWidget("副轴对齐方式 ：$crossAlignSelection"),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: crossAlignSelection,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 100,
                  height: 100,
                  child: Text('Item1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'CrossAxisAlignment',
          CrossAxisAlignment.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() {
              crossAlignSelection = value;
            });
          },
        ),
        TitleWidget('设置TextDirection'),
        SubtitleWidget("文本方向 ：$textDirectionSelection"),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              textDirection: textDirectionSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item3'),
                ),
              ],
            ),
          ),
        ),
        MultiSelectionWidget(
          'TextDirection',
          TextDirection.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() {
              textDirectionSelection = value;
            });
          },
        ),
        TitleWidget("横向输入框"),
        CommonInputRow(
          title: "测试",
          hintText: "请输入",
        ),
        TitleWidget("横向选择"),
        CommonRow(
          title: "个人资料",
          isShowArrowIcon: true,
        ),
      ],
    );
  }
}
