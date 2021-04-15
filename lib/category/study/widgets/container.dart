
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        TitleWidget('Container基本使用'),
        SubtitleWidget('Container在没有子节点的时候，会试图变得足够大，Container在带有子节点的时候，会根据子节点的尺寸调节自身大小'),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
        SubtitleWidget('Container 设置渐变'),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            gradient: RadialGradient(colors: [Colors.green, Colors.blue], stops: [0.5, 1]),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SubtitleWidget('Container与DecoratedBox在使用Border时的不同'),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 10),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text('DecoratedBox的border会占据子widget的显示区域'),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 10),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Text('Container的border会占据子widget的显示区域'),
          ),
        ),
        TitleWidget("尺寸限制类容器组件"),
        SubtitleWidget("ConstrainedBox"),
        SubtitleWidget("宽高约束: 子组件是无法突破其设置的最大宽高。"),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 60, maxWidth: 200),
          child: Container(height: 300, width: 300, color: Colors.redAccent),
        ),
        SubtitleWidget("ConstrainedBox下，BoxConstraints嵌套使用"),
        SubtitleWidget("以最大宽为例，第一个BoxConstraints的maxHeight值是60，"
            "也就是约束其子控件最大高是60，第二个BoxConstraints的maxHeight值是100，"
            "由于第二个BoxConstraints也受第一个的约束，所以第二个BoxConstraints最大"
            "高也只能是60，最终子组件的最大高是60，同理最大宽是200，因此多级BoxConstraints"
            "嵌套约束最大值最终值等于多个BoxConstraints约束中的最小值。"
            "同理嵌套约束最小值等于多个BoxConstraints约束中的最大值。"),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 60, maxWidth: 200),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 240),
            child: Container(height: 300, width: 300, color: Colors.cyan),
          ),
        ),
        SubtitleWidget("SizedBox"),
        SubtitleWidget("能够直接指定具体的宽：200 高：60"),
        SizedBox(
          height: 60,
          width: 200,
          child: RaisedButton(
            child: Text('this is SizedBox'),
          ),
        ),
        SubtitleWidget("AspectRatio"),
        SubtitleWidget("直接指定具体的宽高比例: 2/1"),
        AspectRatio(aspectRatio: 2/1,child: Container(color: Colors.cyan,),),
        SubtitleWidget("FractionallySizedBox"),
        SubtitleWidget("占父组件百分比: 60%"),
        FractionallySizedBox(
          widthFactor: .6,
          child: RaisedButton(
            child: Text('button'),
          ),
        ),
        SubtitleWidget("如果想让2个控件之间的间隔是当前父控件的10%，"
            "可以使用无子控件的FractionallySizedBox"),
        Container(
          height: 140,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.red,
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: .4,
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
