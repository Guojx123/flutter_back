import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class WarpPage extends StatefulWidget {
  @override
  _WarpPageState createState() => _WarpPageState();
}

class _WarpPageState extends State<WarpPage> {
  var direction = Axis.horizontal;
  var mainAlignSelection = WrapAlignment.start;
  double textSpacing = 1.0;
  var crossAlignSelection = WrapCrossAlignment.start;
  var textDirectionSelection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SubtitleWidget('''
direction：主轴（mainAxis）的方向，默认为水平。\n
alignment：主轴方向上的对齐方式，默认为start。\n
spacing：主轴方向上的间距。\n
runAlignment：run的对齐方式。run可以理解为新的行或者列，如果是水平方向布局的话，run可以理解为新的一行。\n
runSpacing：run的间距。\n
crossAxisAlignment：交叉轴（crossAxis）方向上的对齐方式。\n
textDirection：文本方向。\n
verticalDirection：定义了children摆放顺序，默认是down，见Flex相关属性介绍。
        '''),
          Container(
            child: Wrap(
                direction: direction,
                alignment: mainAlignSelection,
                spacing: textSpacing,
                crossAxisAlignment: crossAlignSelection,
                children: tags.map((item) => TagItem(item)).toList()),
          ),
          MultiSelectionWidget(
            'Direction',
            Axis.values,
            Axis.values.map((value) {
              return value.toString().split('.')[1];
            }).toList(),
            (value) {
              setState(() => direction = value);
            },
          ),
          MultiSelectionWidget(
            'Alignment',
            WrapAlignment.values,
            WrapAlignment.values.map((value) {
              return value.toString().split('.')[1];
            }).toList(),
            (value) {
              setState(() => mainAlignSelection = value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'TextSpacing',
                style: TextStyle(fontSize: 16),
              ),
              Slider(
                  max: 10.0,
                  min: 0.5,
                  value: textSpacing,
                  onChanged: (v) {
                    setState(() => textSpacing = v);
                  }),
            ],
          ),
          MultiSelectionWidget(
            'WrapCrossAlignment',
            WrapCrossAlignment.values,
            WrapCrossAlignment.values.map((value) {
              return value.toString().split('.')[1];
            }).toList(),
            (value) {
              setState(() {
                crossAlignSelection = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border:
              Border.all(color: Colors.blueAccent.withAlpha(60), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}

const List<String> tags = [
  "肯德基",
  "小哥哥你的东西掉了",
  "小姐姐好漂亮啊",
  "这个东西是啥",
  "哈哈哈",
  "好困啊",
  "今天好运",
  "明天好运来",
  "今年快结束了",
  "我累啊",
  "你写的什么代码",
  "多多多"
];
