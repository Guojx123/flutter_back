import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class PositionedPage extends StatefulWidget {
  @override
  _PositionedPageState createState() => _PositionedPageState();
}

class _PositionedPageState extends State<PositionedPage> {

  double topSize = 10.0;
  double rightSize = 10.0;
  double leftSize = 10.0;
  double bottomSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget("Positioned 的基本使用"),
        SubtitleWidget("Positioned 定位控件一般需要配合Stack使用"),
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(color: Colors.red),
              ),
              Positioned(
                left: leftSize,
                right: rightSize,
                top: topSize,
                bottom: bottomSize,
                child: Container(color: Colors.teal),
              ),
            ],
          ),
        ),
        MultiSelectionWidget(
            "上边距", [10.0, 20.0, 30.0, 40.0, 50.0], [10, 20, 30, 40, 50], (value) {
              setState(() => topSize = value);
        }),
        MultiSelectionWidget(
            "左边距", [10.0, 20.0, 30.0, 40.0, 50.0], [10, 20, 30, 40, 50], (value) {
          setState(() => leftSize = value);
        }),
        MultiSelectionWidget(
            "右边距", [10.0, 20.0, 30.0, 40.0, 50.0], [10, 20, 30, 40, 50], (value) {
          setState(() => rightSize = value);
        }),
        MultiSelectionWidget(
            "下边距", [10.0, 20.0, 30.0, 40.0, 50.0], [10, 20, 30, 40, 50], (value) {
          setState(() => bottomSize = value);
        }),
        SubtitleWidget("添加背景图片和文字"),
        SizedBox(
          height: 120.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'images/owl.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '示例文字',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
