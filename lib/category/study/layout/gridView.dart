import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {

  int crossAxisCount = 2;
  double maxCrossAxisExtent = 100;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        TitleWidget('GridView.count'),
        SubtitleWidget('子Item中的Size设置无效，尺寸由ViewPort宽度和元素间Spacing决定'),
        Container(
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            childAspectRatio: 2,
            mainAxisSpacing: 8,
            children: generateGrid(),
          ),
        ),
        TitleWidget('GridView.builder'),
        Container(
          height: 100,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
              childAspectRatio: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blueAccent,
                child: Center(child: Text('$index')),
              );
            },
            itemCount: 20,
          ),
        ),
        TitleWidget('设置副轴子元素最大数量'),
        Container(
          height: 280,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: GridView(
                    children: <Widget>[
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.amber,
                      ),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                  ),
              ),
              MultiSelectionWidget(
                '横向个数',
                [1, 2, 3, 4],
                [1, 2, 3, 4],
                (value) {
                  setState(() => crossAxisCount = value);
                },
              ),
            ],
          ),
        ),
        TitleWidget('设置副轴子元素最大宽度'),
        Container(
          height: 200,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: GridView(
                    children: <Widget>[
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                      Container(
                        child: Text('Item'),
                        alignment: Alignment.center,
                        color: Colors.blue,
                      ),
                    ],
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: maxCrossAxisExtent,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                  )
              ),
              MultiSelectionWidget(
                '最大宽度',
                [100.0, 200.0, 400.0],
                [100, 200, 400],
                    (value) {
                  setState(() => maxCrossAxisExtent = value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  generateGrid() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.blueAccent,
        child: Center(child: Text('$index')),
      );
    });
  }
}
