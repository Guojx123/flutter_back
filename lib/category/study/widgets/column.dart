import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {

  var mainAlignSelection = MainAxisAlignment.start;
  var crossAlignSelection = CrossAxisAlignment.start;
  var verticalDirectionSelection = VerticalDirection.down;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        TitleWidget('Column MainAxisAlignment'),
        SubtitleWidget("设置主轴：$mainAlignSelection"),
        MultiSelectionWidget(
          'MainAxisAlignment',
          MainAxisAlignment.values,
          MainAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() => mainAlignSelection = value);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 300,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: mainAlignSelection,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('I  t  e  m  1'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Item2'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('I t e m 3'),
                ),
              ],
            ),
          ),
        ),
        TitleWidget('Column CrossAxisAlignment'),
        SubtitleWidget("设置副轴：$crossAlignSelection"),
        MultiSelectionWidget(
          'CrossAxisAlignment',
          CrossAxisAlignment.values,
          CrossAxisAlignment.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() => crossAlignSelection = value);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.red,
            child: Column(
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
        TitleWidget('设置VerticalDirection'),
        SubtitleWidget("垂直方向：$verticalDirectionSelection"),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 200,
            color: Colors.red,
            child: Column(
              verticalDirection: verticalDirectionSelection,
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
          'VerticalDirection',
          VerticalDirection.values,
          VerticalDirection.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() => verticalDirectionSelection = value);
          },
        ),
      ],
    );
  }
}

