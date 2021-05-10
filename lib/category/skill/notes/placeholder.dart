import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class NotesPlaceholder extends StatefulWidget {
  @override
  _NotesPlaceholderState createState() => _NotesPlaceholderState();
}

class _NotesPlaceholderState extends State<NotesPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          TitleWidget('提示缩小在输入上方'),
          TextField(
            decoration:
            InputDecoration(
                fillColor: Colors.blue.shade100,
                filled: true,
                labelText: 'Hello'),
          ),
          TitleWidget('输入后提示消失，如果输入不符合要求就可以报相应错误（自定义提示语）'),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.blue.shade100,
                filled: true,
                hintText: 'Hello',
                errorText: 'error'),
          ),
          TitleWidget('添加图标'),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.blue.shade100,
                filled: true,
                helperText: 'help',
                prefixIcon: Icon(Icons.local_airport),
                suffixText: 'airport'),
          ),
          TitleWidget('输入框添加圆切角'),
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          ),
          TitleWidget('利用ThemeData改变TextField的边框样色'),
          Theme(
            data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
            ),
          ),
          TitleWidget('改变边框的粗细,这些TextField的decoration彻底不能满足要求了，需要重构成这种方式,InputDecoration.collapsed可以禁用装饰线，而是使用外面包围的Container的装饰线'),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            height: 60.0,
            decoration: new BoxDecoration(
                color: Colors.blueGrey,
                border: new Border.all(color: Colors.black54, width: 4.0),
                borderRadius: new BorderRadius.circular(12.0)),
            child: new TextFormField(
              decoration: InputDecoration.collapsed(hintText: 'hello'),
            ),
          ),
          TitleWidget('设置使用图标'),
          Icon(
            Icons.build_circle,
            size: 300,
            color: Colors.yellow,
            textDirection:TextDirection.rtl ,
            semanticLabel: "语义标签",
          ),
          TitleWidget('占位图'),
          Placeholder(
            color: Colors.blue,
            strokeWidth: 5,
            fallbackHeight: 200,
            fallbackWidth: 200,
          ),
        ],
      ),
    );
  }
}
